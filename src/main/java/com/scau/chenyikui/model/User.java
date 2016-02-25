package com.scau.chenyikui.model;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.MapKeyJoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "users")
public class User {
	// @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Transient
	private int id;
	@Id
	// @Column(unique = true)
	private String username;
	private String password;
	private String email;
	private boolean enabled;
	private String salt;

	@ElementCollection
	@CollectionTable(name = "carts", joinColumns = @JoinColumn(name = "user_id") )
	@MapKeyJoinColumn(name = "item_id")
	@Column(name = "amount")
	private Map<Item, Integer> items_amount = new HashMap<Item, Integer>();

	@OneToMany(mappedBy = "user")
	private Set<Order> orders = new HashSet<Order>();

	public int getId() {
		return id;
	}

	@ElementCollection
	@CollectionTable(name = "authorities", joinColumns = @JoinColumn(name = "username") )
	@Column(name = "authority")
	private Set<String> authorities = new HashSet<String>();

	public void setId(int id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set<String> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(Set<String> authorities) {
		this.authorities = authorities;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public Map<Item, Integer> getItems_amount() {
		return items_amount;
	}

	public void setItems_amount(Map<Item, Integer> items_amount) {
		this.items_amount = items_amount;
	}

}
