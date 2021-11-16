package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;


//==> 雀盔包府 RestController
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public ProductRestController() {
		System.out.println(this.getClass());
	}

	
	
	@RequestMapping( value="json/getProduct/{prodNo}", method=RequestMethod.GET )
	public Product getProduct( @PathVariable int prodNo ) throws Exception{
		
		System.out.println("/product/json/getProduct : GET");
			
		//Business Logic
		return productService.getProduct(prodNo);
		
	}
	
	
		
	@RequestMapping( value="json/addProduct", method=RequestMethod.POST)
	public Product addProduct(@RequestBody Product product) throws Exception{
	
		System.out.println("/product/json/addProduct : POST");
		//Business Logic
		
		System.out.println("::" + product);
		
		productService.addProduct(product);
		
		System.out.println("-----------货肺 积己等 惑前-----------" + product);
		
		
		return product;
	}
	
	
	
	
	@RequestMapping( value="json/updateProduct")
	public Product updateProduct(@RequestBody Product product, HttpSession session ) throws Exception{
		
		
		System.out.println("/product/json/updateProduct : POST");
		
		
		productService.updateProduct(product);
		
		
		System.out.println("----------函版等 惑前-----------" + product);
		
		
		return product;
	}
	
	
	@RequestMapping(value ="json/listProduct/{menu}")	
	public Map<String, Object> listproduct(@RequestBody Search search,
										   @PathVariable String menu) throws Exception {
		
		System.out.println("/product/json/listproduct : POST");
		
		
		productService.getProductList(search);
		
		
		return productService.getProductList(search);
		
	}
	
//	
////	@RequestMapping( value="json/checkDuplication", method=RequestMethod.POST )
////	public String checkDuplication( @RequestBody User user , Model model ) throws Exception{
////		
////		System.out.println("/user/json/checkDuplication : POST");
////		//Business Logic
////		boolean result = userService.checkDuplication(user.getUserId());
////		// Model 苞 View 楷搬
////		
////		return ;
////		
////	}
//	
//		
//	@RequestMapping(value="json/updateUser", method=RequestMethod.POST)
//	public void updateUser(@RequestBody User user) throws Exception {
//		
//		System.out.println("/user/json/updateUser : POST");
//		
//		System.out.println("::"+user);
//		
//		
//		userService.updateUser(user);
//				
//		System.out.println("::upadateUser"+user);
//	}
//	
//	
//	
	

	
	
}