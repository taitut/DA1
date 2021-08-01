package com.fpoly.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.fpoly.entity.OrderEntity;

public interface OderRepository extends JpaRepository<OrderEntity, Long> {
	
	
	/*
	 * @Query("SELECT o.createDate, o.address, a.fullName FROM Order o inner join Accounts a on o.account_id = a.id"
	 * ) List<OrderEntity> showOrder();
	 */
	Page<OrderEntity> findAll(Pageable pageable);
	
	@Query(value = "SELECT * FROM oder  where accountid = :id order by createdate desc Limit 1 ", nativeQuery=true) 
	OrderEntity findOneByAccountId(@Param("id") Long id);
	
	@Query(value = "SELECT  sum(o.totalprice), count(accountid), sum(d.quantity)\r\n"
			+ "FROM oder o INNER JOIN orderdetails d ON o.id = d.orderid\r\n"
			+ "where year(o.modifieddate) = :year ", nativeQuery=true) 
	List<Object[]> findpriceYear(@Param("year") int year);
	
	@Query(value = "SELECT month(o.modifieddate), sum(o.totalprice)\r\n"
			+ "FROM oder o \r\n"
			+ "where year(modifieddate) = :year \r\n"
			+ "GROUP BY month(o.modifieddate) \r\n"
			+ "ORDER BY month(o.modifieddate) ASC", nativeQuery=true) 
	List<Object[]> findAllByYear(@Param("year") int year);
	
	@Query(value= "SELECT o.* \r\n"
			+ "from oder o INNER JOIN accounts a on o.accountid =  a.id\r\n"
			+ "where a.userame = :username",nativeQuery=true)
	List<OrderEntity> findAllBuyUsername(String username);
	
	
}
