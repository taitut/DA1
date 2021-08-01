package com.fpoly.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Table(name="Accounts")
@EntityListeners(AuditingEntityListener.class)
@Data
@EqualsAndHashCode(callSuper=false)

@SQLDelete(sql = "UPDATE Accounts SET status = 1 WHERE id=?")
@Where(clause = "status=0")
public class AccountsEntity extends BaseEntity {
	
	@Column (name = "userame" ,length = 50,unique = true)
	@NotBlank(message = "Hãy nhập UserName")
	
	private String userName;
	
	@Column (name = "password")
	@Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{6,}$",message = "Nhập tối thiểu 6 kÍ tự và có chứa ít nhất một kí tự là chữ cái và số")
	private String password;
	
	@Column (name = "fullname")
	@NotBlank(message = "Hãy nhập họ tên")
	private String fullname;
	
	@Column (name = "email",unique = true)
	@Email(message = "Sai định dạng email Hoặc email đã tồn tại")
	@NotBlank(message = "Hãy nhập email")
	private String email;
	
	@Column (name = "photo")
	private String photo;
	
	@Column (name = "forgotCode")
	private String forgotCode;
	
	@Column (name = "role")
	private Role role;

	
	@OneToMany(mappedBy = "account")
	 private List<OrderEntity> invoice;
	
}
