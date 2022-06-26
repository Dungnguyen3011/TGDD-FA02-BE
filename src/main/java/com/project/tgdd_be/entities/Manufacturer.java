
package com.project.tgdd_be.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Table(name="tbl_Manufacturer")
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Manufacturer {
    @Id
	@GeneratedValue(strategy=GenerationType.IDENTITY) 
    @Column(name="manufacturer_id")
	private int manufacturerId;
    @Column(name="manufacturer_name")
	private String manufacturerName;
	
    
}
