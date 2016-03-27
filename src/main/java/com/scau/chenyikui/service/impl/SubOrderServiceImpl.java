package com.scau.chenyikui.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scau.chenyikui.dao.SubOrderDAO;
import com.scau.chenyikui.dao.impl.BaseDAOImpl;
import com.scau.chenyikui.model.Shop;
import com.scau.chenyikui.model.SubOrder;
import com.scau.chenyikui.service.SubOrderService;

@Service
public class SubOrderServiceImpl extends BaseServiceImpl<SubOrder> implements SubOrderService {

	@Autowired
	private SubOrderDAO subOrderDAO;

	@Autowired
	public SubOrderServiceImpl(BaseDAOImpl<SubOrder> baseDAO) {
		super(baseDAO);
	}

	@Transactional(readOnly = true)
	@Override
	public List<SubOrder> getSubOrdersByShop(Shop shop) {
		return subOrderDAO.getSubOrdersByShop(shop);
	}

}
