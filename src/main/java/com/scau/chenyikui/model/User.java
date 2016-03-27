package com.scau.chenyikui.model;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.MapKeyJoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

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
	private Date date;
	private String phone;
	private String avatar;
	@Transient
	private MultipartFile avatarFile;

	@ElementCollection
	@CollectionTable(name = "carts", joinColumns = @JoinColumn(name = "user_id") )
	@MapKeyJoinColumn(name = "item_id")
	@Column(name = "amount")
	private Map<Item, Integer> items_amount = new HashMap<Item, Integer>();

	@OneToMany(mappedBy = "user")
	private Set<Order> orders = new HashSet<Order>();

	@ElementCollection(fetch = FetchType.EAGER)
	@CollectionTable(name = "itemCollection", joinColumns = @JoinColumn(name = "username") )
	@Column(name = "item")
	public Set<Item> itemCollection = new HashSet<Item>();

	@ElementCollection(fetch = FetchType.EAGER)
	@CollectionTable(name = "authorities", joinColumns = @JoinColumn(name = "username") )
	@Column(name = "authority")
	private Set<String> authorities = new HashSet<String>();

	@ElementCollection
	@CollectionTable(name = "addresses", joinColumns = @JoinColumn(name = "username") )
	@Column(name = "address")
	private Set<String> addresses = new HashSet<String>();

	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	public Shop shop;

	@ElementCollection(fetch = FetchType.EAGER)
	@CollectionTable(name = "shopCollection", joinColumns = @JoinColumn(name = "username") )
	@Column(name = "shop")
	public Set<Shop> shopCollection = new HashSet<Shop>();

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

	public Set<Item> getItemCollection() {
		return itemCollection;
	}

	public void setItemCollection(Set<Item> itemCollection) {
		this.itemCollection = itemCollection;
	}

	public Set<Shop> getShopCollection() {
		return shopCollection;
	}

	public void setShopCollection(Set<Shop> shopCollection) {
		this.shopCollection = shopCollection;
	}

	public Set<String> getAddresses() {
		return addresses;
	}

	public void setAddresses(Set<String> addresses) {
		this.addresses = addresses;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public MultipartFile getAvatarFile() {
		return avatarFile;
	}

	public void setAvatarFile(MultipartFile avatarFile) {
		this.avatarFile = avatarFile;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

}
