package com.scau.chenyikui.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.scau.chenyikui.dao.SubOrderDAO;
import com.scau.chenyikui.model.Shop;
import com.scau.chenyikui.model.SubOrder;

@Repository
public class SubOrderDAOImpl extends BaseDAOImpl<SubOrder> implements SubOrderDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<SubOrder> getSubOrdersByShop(Shop shop) {
		return sessionFactory.getCurrentSession().createQuery("from SubOrder subOrder where subOrder.item.shop =:shop")
				.setParameter("shop", shop).list();
	}

}
