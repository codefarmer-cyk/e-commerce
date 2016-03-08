package com.scau.chenyikui.model;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "orders")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	private User user;

	@ElementCollection(fetch = FetchType.EAGER)
	@CollectionTable(name = "orders_items", joinColumns = @JoinColumn(name = "order_id") )
	@MapKeyJoinColumn(name = "item_id")
	@Column(name = "amount")
	private Map<Item, Integer> items_amount = new HashMap<Item, Integer>();

	private Date date;

	private String status;

	private double cost;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public Map<Item, Integer> getItems_amount() {
		return items_amount;
	}

	public void setItems_amount(Map<Item, Integer> items_amount) {
		this.items_amount = items_amount;
	}

}
