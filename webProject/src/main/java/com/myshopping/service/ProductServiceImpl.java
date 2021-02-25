package com.myshopping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myshopping.domain.ProductVO;
import com.myshopping.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {
	
	private ProductMapper mapper;
	
	@Override
	public void Register(ProductVO product) {
		mapper.insert(product);
	}

	@Override
	public ProductVO get(Long product_code) {
		// TODO Auto-generated method stub
		return mapper.read(product_code);
	}

	@Override
	public boolean modify(ProductVO product) {
		return mapper.update(product) == 1;
	}

	@Override
	public boolean remove(Long product_code) {
		return mapper.delete(product_code) == 1;
	}
	
	@Override
	public List<ProductVO> getBestListHome() {
		return mapper.readBestProductHome();
	}
	
	@Override
	public List<ProductVO> getCtgrList(String product_ctgr) {
		return mapper.readCategori(product_ctgr);
	}

	@Override
	public List<ProductVO> getBestList(String product_ctgr) {
		return mapper.readBestProduct(product_ctgr);
	}

	

}
