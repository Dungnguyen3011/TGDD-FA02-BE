package com.project.tgdd_be.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.project.tgdd_be.entities.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {
	@Query(value = "SELECT o FROM Order o WHERE "
			+ " o.phoneNumber LIKE CONCAT('%',:query,'%')")
	List<Order> listOrderBySpecificPhone(String query);
	
	@Query(value ="SELECT o FROM Order o WHERE "
			+ " o.shippingStatus = 'true' ")
	List<Order> listOrderForCus();
	
	public Order findByPhoneNumber(String phoneNumber);
}
