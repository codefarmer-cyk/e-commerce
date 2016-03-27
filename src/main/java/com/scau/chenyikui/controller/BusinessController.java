package com.scau.chenyikui.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.scau.chenyikui.aop.ControllerAdvice;
import com.scau.chenyikui.model.Category;
import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.Order;
import com.scau.chenyikui.model.Shop;
import com.scau.chenyikui.model.SubOrder;
import com.scau.chenyikui.model.User;
import com.scau.chenyikui.service.CategoryService;
import com.scau.chenyikui.service.ItemService;
import com.scau.chenyikui.service.OrderService;
import com.scau.chenyikui.service.ShopService;
import com.scau.chenyikui.service.SubOrderService;
import com.scau.chenyikui.service.UserService;

@Controller
public class BusinessController {

	@Autowired
	private UserService userService;

	@Autowired
	private ItemService itemService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private SubOrderService subOrderService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private ShopService shopService;

	@RequestMapping(value = "/business", method = RequestMethod.GET)
	public String business(String page, Model model) {
		User user = userService.get(ControllerAdvice.getPrincipal());
		model.addAttribute("user", user);
		if (page != null) {
			if (page.equals("itemList")) {
				List<Item> itemList = itemService.getItems(user);
				List<Category> categories = categoryService.getCategories();
				model.addAttribute(itemList);
				model.addAttribute("categories", categories);
				model.addAttribute("newItem", new Item());
			} else if (page.equals("orderList")) {
				List<SubOrder> subOrderList = subOrderService.getSubOrdersByShop(user.getShop());
				model.addAttribute("subOrderList", subOrderList);
			} else if (page.equals("saleInfo")) {
				Shop shop = shopService.getShop(ControllerAdvice.getPrincipal());
				StringBuilder sb = new StringBuilder("[");
				int step = 100;
				for (Item item : shop.getItems()) {
					int red = (int) (Math.random() * 245);
					int blue = (int) (Math.random() * 245);
					int green = (int) (Math.random() * 245);
					sb.append("{value:" + item.getSale() + ",color:\"rgb(" + red + "," + blue + "," + green
							+ ")\",highlight : \"rgb(" + (red + 10) + "," + (blue + 10) + "," + (green + 10)
							+ ")\",label:\"" + item.getName() + "\"},");
					step += 50;
				}
				sb.append("]");
				model.addAttribute("pieData", sb);
			} else {
				model.addAttribute("addresses", userService.getAddress(user));
				Shop shop = shopService.getShop(ControllerAdvice.getPrincipal());
				model.addAttribute("shop", shop);
			}
			model.addAttribute("page", page);
		}
		return "business";
	}

	@RequestMapping(value = "/business/newItem", method = RequestMethod.POST)
	public String newItem(@ModelAttribute(value = "newItem") Item item, HttpServletRequest request) {
		List<MultipartFile> images = item.getImages();
		List<String> imageNames = new ArrayList<String>();
		item.setDate(new Date());
		User user = userService.get(ControllerAdvice.getPrincipal());
		item.setShop(user.getShop());
		if (null != images && images.size() > 0) {
			for (MultipartFile image : images) {
				String imageName = image.getOriginalFilename();
				imageNames.add(imageName);
				File imageFile = new File(request.getRealPath("/resources/img/items"), imageName);
				try {
					image.transferTo(imageFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		item.setImgs(imageNames);
		itemService.save(item);
		return "redirect:/business?page=itemList";
	}

	@RequestMapping(value = "/business/updateShop", method = RequestMethod.POST)
	public String updateUser(String name, String description, String address, MultipartFile icon,
			HttpServletRequest request) {
		Shop shop = shopService.getShop(ControllerAdvice.getPrincipal());
		shop.setName(name);
		if (!icon.isEmpty()) {
			String iconName = icon.getOriginalFilename();
			File iconFile = new File(request.getRealPath("/resources/img/shop"), iconName);
			try {
				icon.transferTo(iconFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			shop.setIcon(iconName);
		}
		shop.setAddress(address);
		shop.setDescription(description);
		shopService.save(shop);
		return "redirect:/business?page=shopInfo";
	}

	@RequestMapping(value = "/business/updateItem", method = RequestMethod.POST)
	public String updateItem(@ModelAttribute("newItem") Item item) {
		Item oldItem = itemService.get(item.getId());
		oldItem.setCategory(item.getCategory());
		oldItem.setName(item.getName());
		oldItem.setDescription(item.getDescription());
		oldItem.setPrice(item.getPrice());
		oldItem.setStock(item.getStock());
		itemService.save(oldItem);
		return "redirect:/business?page=itemInfo";
	}

	@RequestMapping(value = "/business/sendItem", method = RequestMethod.POST)
	public void sendItem(int subOrderId, HttpServletResponse response) {
		SubOrder subOrder = subOrderService.get(subOrderId);
		subOrder.setStatus("STATUS_SENT");
		subOrderService.save(subOrder);
		boolean flag = true;
		Order order = subOrder.getOrder();
		for (SubOrder so : order.getSubOrders()) {
			if (!so.getStatus().equals("STATUS_SENT")) {
				flag = false;
				break;
			}
		}
		if (flag) {
			order.setStatus("STATUS_PROCESSING");
			orderService.save(order);
		}
		try {
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.write("{\"result\":\"success\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
