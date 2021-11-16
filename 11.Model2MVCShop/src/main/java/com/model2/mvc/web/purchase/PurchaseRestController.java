package com.model2.mvc.web.purchase;

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
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	public PurchaseRestController() {
		System.out.println(this.getClass());
	}

	
	
	@RequestMapping( value="json/getPurchase/{tranNo}", method=RequestMethod.GET )
	
	public Purchase getPurchase( @PathVariable int tranNo ) throws Exception{
		
		System.out.println("/purchase/json/getPurchase : GET");
			
		//Business Logic
		return purchaseService.getPurchase(tranNo);
				
		
	}
	
	
		
	@RequestMapping( value="json/addPurchase")
	public Purchase addPurchase(@RequestBody Purchase purchase) throws Exception{
	
		System.out.println("/purchase/json/addPurhcase : POST");
		//Business Logic
		
		System.out.println("::" + purchase);
		
		purchaseService.addPurchase(purchase);
		
		System.out.println("-----------새로 구매한 상품-----------" + purchase);
		
		
		return purchase;
	}
	
	
	
	
	@RequestMapping( value="json/updatePurchase")
	public Purchase updatePurchase(@RequestBody Purchase purchase, HttpSession session ) throws Exception{
		
		
		System.out.println("/purchase/json/updatePurchase : POST");
		
		
		purchaseService.updatePurchase(purchase);
		
		
		System.out.println("----------변경된 구매정보-----------" + purchase);
		
		
		return purchase;
	}
	
	
//	@RequestMapping(value ="json/listPurchase/{menu}")	
//	public Map<String, Object> listpurchase(@RequestBody Search search, @RequestBody Purchase purchase,
//										    @PathVariable String menu) throws Exception {
//		
//		System.out.println("/purchase/json/listpurchase : POST");
//		
//		//purchaseService.getPurchaseList(search, purchase);
//		
//		
//		return productService.getProductList(search);
//		
//	}
//	
//	
//	@RequestMapping(value="json/updateTranCodeByProd/{prodNo}", method=RequestMethod.GET)
//	public Purchase updateTranCodeByProd(@PathVariable int prodNo) throws Exception {
//		
//		System.out.println("/purchase/json/updateTranCodeByProd : GET");
//		
//		
//		Purchase purchase = purchaseService.getPurchase2(prodNo);
//		
//		String tran = TranCode;
//		
//		if("001".equals(tran)) {
//			tran = "002";
//			
//			purchase.setTranCode(tran);
//			
//			purchaseService.updateTranCode(purchase);
//		}
//		
//		return purchaseService.getPurchase2(prodNo);
//		
//	}
//	
//	
	
	

	
	
}