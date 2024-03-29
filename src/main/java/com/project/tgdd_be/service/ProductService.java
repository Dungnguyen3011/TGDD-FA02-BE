package com.project.tgdd_be.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.project.tgdd_be.entities.Product;
import com.project.tgdd_be.model.dto.ProductDTO;

public interface ProductService {
	
	public List<ProductDTO> listAll(Pageable pageable);
	
	int totalItems();
		
	public Product save(Product product);
	
	public void delete(Integer id);

	public ProductDTO getProductDtobyID(Integer id);
	
	public Product getProductbyID(Integer id);
	
	public List<ProductDTO> searchProducts(String query);
	
	public List<ProductDTO> searchProductsforCus(String query);
	
	public List<ProductDTO> listAllForCus();
	
	public List<ProductDTO> listSale();
	
	public List<ProductDTO> listSale99();
	
	public List<ProductDTO> listProductDTOFindByLocation(Integer id);
	
	public List<ProductDTO> listProductDTOByCategory(Integer id);
	
	public List<ProductDTO> listProductDTOByManufacturer(Integer id);
	
	public List<ProductDTO> filterByLocationAndCategory(Integer locationDd, Integer categoryid);
	
	public List<Product> listProductByManufacturer(Integer id);

	public List<Product> listProductByCategory(Integer id);
	
	public List<Product> listProductByStore(Integer id);
}
	