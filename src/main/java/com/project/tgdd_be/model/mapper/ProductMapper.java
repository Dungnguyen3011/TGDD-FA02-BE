package com.project.tgdd_be.model.mapper;

import com.project.tgdd_be.entities.Product;
import com.project.tgdd_be.model.dto.ProductDTO;

public class ProductMapper {
	public static  ProductDTO toProductDTO(Product product) {
		ProductDTO tmp = new ProductDTO();
		tmp.setProductId(product.getProductId());
		tmp.setProductName(product.getProductName());
		tmp.setQuantity(product.getQuantity());
		tmp.setUnitPrice(product.getUnitPrice());
		tmp.setSalePrice(product.getSalePrice());
		tmp.setDescription(product.getDescription());
		tmp.setRate(product.getRate());
		tmp.setStatus(product.getStatus());
		tmp.setImage(product.getImage());
		tmp.setCategoryName(product.getCategory().getCategoryName());
		tmp.setManufacturerName(product.getManufacturer().getManufacturerName());
		tmp.setStoreName(product.getStore().getStoreName());
		
		return tmp;
	}
}
