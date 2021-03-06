package com.myshopping.mapper;

import java.util.List;

import com.myshopping.domain.ProductImageVO;

public interface ProductImageMapper {
	
	public void insert(ProductImageVO productImage);
	
	public void delete(String uuid);
	
	public List<ProductImageVO> findByProductcode(Long product_code);
}
