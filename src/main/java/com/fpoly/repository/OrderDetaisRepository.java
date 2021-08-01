package com.fpoly.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.fpoly.entity.OrderDetailsEntity;

public interface OrderDetaisRepository extends JpaRepository<OrderDetailsEntity, Long> {
	
	/*
	 * @Query("select o from orderdetails o where o.orderid = ?1")
	 * OrderDetailsEntity findAllBuyOrderId(Long id);
	 */
	@Query( value = "SELECT * FROM orderdetails u WHERE u.orderid = ?1", 
			  nativeQuery = true)
	List<OrderDetailsEntity>  findAllBuyOrderId(Long id);
	
	@Query(value = "select month(o.createdate), o.productid, o.quantity  "
			+ "from orderdetails o where month(o.createdate) = '?1'"
			+"order by o.price  desc",nativeQuery = true)
	OrderDetailsEntity fidoanhthu(String thang);
	
	@Query(value = "select c.name , sum(o.price) as price \r\n"
			+ "from orderdetails o INNER JOIN product p on o.productid  = p.id\r\n"
			+ "		INNER JOIN categories c on p.categories_id = c.id\r\n"
			+ "        where year(o.modifieddate)  = :year \r\n"
			+ "        GROUP BY c.name", nativeQuery=true) 
	List<Object[]> findByCategory(@Param("year") int year);
}
