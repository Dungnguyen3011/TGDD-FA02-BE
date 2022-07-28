package com.project.tgdd_be.controllers;

import java.util.List;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.project.tgdd_be.entities.Category;
import com.project.tgdd_be.entities.Manufacturer;
import com.project.tgdd_be.entities.Product;
import com.project.tgdd_be.entities.Store;
import com.project.tgdd_be.model.dto.CategoryDTO;
import com.project.tgdd_be.model.dto.ProductDTO;
import com.project.tgdd_be.service.CategoryService;
import com.project.tgdd_be.service.ManufacturerService;
import com.project.tgdd_be.service.ProductService;
import com.project.tgdd_be.service.StoreService;

@RestController
public class CategoryAPI {
	
	@Autowired
	private CategoryService cs;
	
	@Autowired
	private ProductService sv;
	
	@Autowired
	private ManufacturerService Msv;

	@Autowired
	private StoreService Ssv;
	
	public Category dtoToCategory(CategoryDTO cateDTO) {
		Category cate = new Category(cateDTO.getCategoryId(), cateDTO.getCategoryName(),cateDTO.getStatus());
		return cate;
	}
	
	public Product dtotoProduct(ProductDTO productdto) {
		Manufacturer manu = Msv.getManufacturerbyID2(productdto.getManufacturerId());
		Category cate = cs.getCategorByID(productdto.getCategoryId());
		Store sto = Ssv.getStorebyID(productdto.getStoreId());
		Product pro = new Product(productdto.getProductId(), productdto.getProductName(), productdto.getQuantity(),
				productdto.getUnitPrice(), productdto.getSalePrice(), productdto.getDescription(), productdto.getRate(),
				productdto.getStatus(), productdto.getImage(), cate, manu, sto);
		return pro;
	}
//	public Category dtoToStatusCategory(CategoryDTO cateDTO) {
//		Category cate = new Category(cateDTO.getCategoryId(),cateDTO.getStatus());
//		return cate;
//	}
	
	@GetMapping("/api/admin/category")
	public ResponseEntity<?> getAll(){
		List<CategoryDTO> cate= cs.listAllDTO();
		return ResponseEntity.ok(cate);
	}
	
	@GetMapping("/api/categoryForcus")
	public ResponseEntity<?> getAllForCus(){
		List<CategoryDTO> cate= cs.listAllForCus();
		return ResponseEntity.ok(cate);
	}
	
	@PostMapping("/api/admin/category")
	public ResponseEntity<?> createCategory(@RequestBody @Valid CategoryDTO cateDTO) {
		Category cate = dtoToCategory(cateDTO);
		return ResponseEntity.ok(cs.save(cate));
	}
	
	@PutMapping("/api/admin/category/{id}")
	public ResponseEntity<?> updateCategory(@PathVariable Integer id, @RequestBody @Valid CategoryDTO cateDTO){
		
			Category cate = dtoToCategory(cateDTO);
			cate.setCategoryId(id);
			return ResponseEntity.ok(cs.save(cate));
		
	}
	
	@PutMapping("/api/admin/deleteCategory/{id}")
	public ResponseEntity<?> updateStatusCategory(@PathVariable Integer id) {
		CategoryDTO cateDTO = cs.findCategoryById(id);
		Category cate = dtoToCategory(cateDTO);
		cate.setStatus(false);
		for(ProductDTO dto : sv.listProductDTOByCategory(id)) {
			Product pro = dtotoProduct(dto);
			pro.setStatus(false);
			sv.save(pro);
		}
		return ResponseEntity.ok(cs.save(cate));
	}
	
}
