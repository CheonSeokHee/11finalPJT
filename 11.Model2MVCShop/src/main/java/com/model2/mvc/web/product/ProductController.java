package com.model2.mvc.web.product;

import java.io.File;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public ProductController() {
		System.out.println(this.getClass());
	}

	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	//@RequestMapping("/addProductView.do")
	@RequestMapping(value="addProduct",method=RequestMethod.GET)
	public ModelAndView addProductView() throws Exception {
		

		
		System.out.println("/addProduct : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/product/addProductView.jsp");
		return modelAndView;
	}
	
	//private static final String FILE_SERVER_PATH = "C:\\Users\\aiacademy\\git\\11PJT\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";
	private static final String FILE_SERVER_PATH = "C:\\workspace_csh(비트 1022)\\11.Model2MVCShop\\src\\main\\webapp\\images\\uploadFiles";
	
	
	//@RequestMapping("/addProduct.do")
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
	public ModelAndView addProduct( @ModelAttribute("product") Product product , HttpServletRequest request,
									@RequestParam("proImage") MultipartFile proImage ) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(!proImage.getOriginalFilename().isEmpty()) {
			
			
			proImage.transferTo(new File(FILE_SERVER_PATH,proImage.getOriginalFilename()));
			
			modelAndView.addObject("msg", "File uploaded successfully.");
			
			System.out.println("파일 업로드 성공!!!");
			
		}else {
			modelAndView.addObject("msg", "Please select a valid mediaFile..");
		}
		
		
		product.setFileName(proImage.getOriginalFilename());
		
		System.out.println("/addProduct : POST");
		//Business Logic

		productService.addProduct(product);
		
	
		modelAndView.addObject("product", product);
		modelAndView.setViewName("forward:/product/addProduct.jsp");
		
		
		return modelAndView;
	}
	
	//@RequestMapping("/getProduct.do")
	@RequestMapping(value="getProduct",method=RequestMethod.GET)
	public ModelAndView getProduct( @RequestParam("prodNo") int prodNo , Model model ,
									HttpServletRequest request ,HttpServletResponse response ) throws Exception {
		
		System.out.println("/getProduct : 	GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		
		ModelAndView modelAndView = new ModelAndView();
		
		
		model.addAttribute("product", product);
		model.addAttribute("menu",request.getParameter("menu"));
				
		modelAndView.addObject("product", product);
		modelAndView.addObject("menu",request.getParameter("menu"));
		modelAndView.setViewName("forward:/product/getProduct.jsp");
		
		
		
		Cookie[] cook = request.getCookies();
		
		Cookie cookiee = null;;
		
		//System.out.println("--------cookiee--------" + cookiee);
		
		
		if(cook !=null && cook.length > 0) {
			for (int i = 0; i < cook.length; i++) {
				if (cook[i].getName().equals("history")) {
					cookiee = new  Cookie("history", cook[i].getValue() + "," + prodNo);
					
					}else {
					cookiee = new Cookie("history", String.valueOf(prodNo));
				}
			}
		}
		
		else {
			cookiee = new Cookie("history", String.valueOf(prodNo));
			
		}
		
		cookiee.setPath("/");
		
		// 꼭 setPath 넣어주기 다 받겠단느 의미!!
		
		System.out.println("--------cookiee1--------" + cookiee);
		//Cookie cookie = new Cookie("history",String.valueOf(prodNo));
		
		response.addCookie(cookiee);
		
		System.out.println("--------cookiee2--------" + request.getCookies()[0].getName());
				
		return modelAndView;
	}
	
	//@RequestMapping("/updateProductView.do")
	@RequestMapping(value="updateProduct",method=RequestMethod.GET)
	public ModelAndView updateProductView( @RequestParam("prodNo") int prodNo , Model model) throws Exception{

		System.out.println("/updateProduct : GET");
		//Business Logic
		
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("product", product);
		modelAndView.setViewName("forward:/product/updateProductView.jsp");
		
		return modelAndView;
	}
	
	//@RequestMapping("/updateProduct.do")
	@RequestMapping(value="updateProduct",method=RequestMethod.POST)
	public ModelAndView updateProduct( @ModelAttribute("product") Product product , Model model , HttpSession session) throws Exception{

		
		System.out.println("/updateProduct : post");
		
		//Business Logic
		
		
		productService.updateProduct(product);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/product/getProduct?prodNo="+ product.getProdNo()+"&menu=manage");
		
		
		
		return modelAndView;
	}
	
	//@RequestMapping("/listProduct.do")
	@RequestMapping(value="listProduct")
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request ) throws Exception{
		
		System.out.println("/listProduct");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu",request.getParameter("menu"));
		model.addAttribute("proTranCode","000");
		
		
		return "forward:/product/listProduct.jsp";

	}
	
	
}
