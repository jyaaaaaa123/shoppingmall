package com.myshopping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.myshopping.domain.Criteria;
import com.myshopping.domain.OrderProductVO;
import com.myshopping.domain.ProductVO;

public interface ProductMapper {
	
	//전체 목록 조회
	public List<ProductVO> getList();
	
	//페이징처리
	public List<ProductVO> getListWithPaging(Criteria cri);
	
	//pk값을 알필요 없는 경우와 알아야 하는 경우 C
	public void insert(ProductVO product);
	
	public void insertSelectKey(ProductVO product);
	
	
	//상품코드로 가져오기 R
	public ProductVO read(Long product_code);
	
	//카테고리로 가져오기
	public List<ProductVO> readCategori(@Param("product_ctgr") String product_ctgr, @Param("cri") Criteria cri);
	
	//인기상품 조회
	public List<ProductVO> readBestProduct(String product_ctgr);
	
	public List<ProductVO> readBestProductHome();
	
	//삭제완료시 1, 없을시 0 D
	public int delete(Long product_code);
	
	//Update
	public int update(ProductVO product);
	
	//update Stock
	public int updateProductStock(OrderProductVO op);
	
	//update sales
	public int updateProductSales(OrderProductVO op);
}
