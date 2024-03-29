package com.lucle.myp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lucle.myp.domain.GroupBuyingVo;
import com.lucle.myp.domain.MarketVo;
import com.lucle.myp.domain.UserVo;
import com.lucle.myp.service.MarketService;
import com.lucle.myp.service.ProductService;

@Controller
@RequestMapping("/prlist/*")
public class ProductController {

    private final ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("product", new MarketVo());
        return "/prlist/register";
    }

    @PostMapping("/register")
    public String registerProduct(@ModelAttribute MarketVo product, RedirectAttributes redirectAttributes) {
        productService.insertProduct(product);
        redirectAttributes.addFlashAttribute("message", "Product successfully registered!");
        return "redirect:/";
    }

    @GetMapping("/list")
    public String listProducts(Model model) {
        model.addAttribute("products", productService.selectAllProducts());
        return "/prlist/list";
    }

    @GetMapping("/{id}")
    public String getProductById(@PathVariable("id") int productId, Model model) {
       MarketVo product = productService.selectProductById(productId);
        model.addAttribute("product", product);
        return "product_detail";
    }

    @GetMapping("/edit/{num}")
    public String showEditForm(@PathVariable("num") int productId, Model model) {
       MarketVo product = productService.selectProductById(productId);
        model.addAttribute("product", product);
        return "/prlist/edit";
    }

    @PostMapping("/update")
    public String updateProduct(@ModelAttribute MarketVo product, RedirectAttributes redirectAttributes) {
        productService.updateProduct(product);
        redirectAttributes.addFlashAttribute("message", "Product successfully updated!");
        return "redirect:/";
    }

    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable("id") int productId, RedirectAttributes redirectAttributes) {
        productService.deleteProductById(productId);
        redirectAttributes.addFlashAttribute("message", "Product successfully deleted!");
        return "redirect:/product/list";
    }
    
    @GetMapping("/poplist")
    public String viewRecommendations(Model model) {
        List<MarketVo> productDetails = productService.getRecommendedProductDetails();
        model.addAttribute("productDetails", productDetails);
        return "/prlist/poplist"; // This is the JSP file name without the .jsp extension
    }
    
    @Autowired
    MarketService marketService;
    
    @GetMapping("/recolist")
    public String allProduct(Model model) throws Exception {
        List<MarketVo> products = marketService.groupBuying();
        List category = productService.cateList();
      ObjectMapper objm = new ObjectMapper();
      String cateList = objm.writeValueAsString(category);
      model.addAttribute("cateList", cateList);
      
      System.out.println(category);
      System.out.println(cateList);
        model.addAttribute("products", products);
        return "/prlist/recolist"; // This is the JSP file name without the .jsp extension
    }
    
    @GetMapping("/allProduct")
    public String allProducts(Model model) throws Exception {
        List<MarketVo> products = marketService.groupBuying();
        List category = productService.cateList();
      ObjectMapper objm = new ObjectMapper();
      String cateList = objm.writeValueAsString(category);
      model.addAttribute("cateList", cateList);
      
      System.out.println(category);
      System.out.println(cateList);
        model.addAttribute("products", products);
        return "/prlist/allProduct"; // This is the JSP file name without the .jsp extension
    }
    
    @GetMapping("/productsByCategory")
    public ResponseEntity<List<MarketVo>> getProductsByCategory(@RequestParam String cateCode, Model model) {
        // cateCode에 해당하는 제품을 데이터베이스에서 조회
        List<MarketVo> products = productService.getProductsByCategory(cateCode);
        System.out.println(products);
        System.out.println("카테코드" + cateCode);
        model.addAttribute("products", products);
        return ResponseEntity.ok(products);
    }
    
    @RequestMapping(value = "/rankedUser", method = RequestMethod.GET)
    public String getOrderList(HttpSession session, Model model) throws Exception {
        // 로그인된 사용자 정보를 세션에서 가져옵니다.
        UserVo member = (UserVo)session.getAttribute("loginVo");

        // 로그인된 사용자의 ID를 가져옵니다.
        String id = member.getId();
        // 해당 유저 ID로 상품을 조회합니다.
        List<MarketVo> rankView = productService.rankedViewByUser(id);
        // 조회된 상품 리스트를 모델에 추가합니다. 여기서는 각 MarketVo 객체의 id를 따로 설정할 필요가 없습니다.
        model.addAttribute("rankView", rankView);
        System.out.println("프로덕트 " + rankView);
        boolean isLoggedIn = session.getAttribute("loginVo") != null;
        model.addAttribute("isLoggedIn", isLoggedIn);

        return "/prlist/rankedUser";
    }s
}