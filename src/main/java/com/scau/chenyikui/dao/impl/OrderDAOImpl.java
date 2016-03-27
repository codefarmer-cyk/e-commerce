package com.scau.chenyikui.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.scau.chenyikui.dao.OrderDAO;
import com.scau.chenyikui.model.Order;
import com.scau.chenyikui.model.User;

@Repository
public class OrderDAOImpl extends BaseDAOImpl<Order> implements OrderDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> getOrders() {
		return sessionFactory.getCurrentSession().createQuery("from Order").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> getOrders(User user) {
		return sessionFactory.getCurrentSession().createQuery("from Order order where order.user=:user")
				.setParameter("user", user).list();
	}

	@Deprecated
	@SuppressWarnings("unchecked")
	@Override
	public List<Order> getOrdersByBusiness(User business) {
		System.out.println(business);
		return sessionFactory.getCurrentSession()
				.createSQLQuery(
						"select o.* from orders o join orders_items oi join items i on o.id=oi.order_id and i.id=oi.item_id where i.shop_id=:shop_id")
				.addEntity(Order.class).setParameter("shop_id", business.getShop().getId()).list();
	}

}
