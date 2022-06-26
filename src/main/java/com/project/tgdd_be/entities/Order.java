package com.project.tgdd_be.entities;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="tbl_order")
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_id", nullable = false, updatable = false)
	private String orderId;
	
	@Column(name="customer_name")
	private String customerName;
	
	@Column(name="order_date")
	private Date orderDate;
	
	@Column(name="address")
	private String address;
	
	@Column(name="phone_number")
	private String phone;
	
	@Column(name="email")
	private String email;
	
	@Column(name="shipping_type")
	private String shipping;
	
	@Column(name="total_price")
	private float total;
	
	@Column(name="status")
	private boolean status;
}
