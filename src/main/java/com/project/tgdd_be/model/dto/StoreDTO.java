package com.project.tgdd_be.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class StoreDTO {
	private Integer storeId;
	
	private String storeName;
	
	private boolean status;
	
	private String locationName;

}
