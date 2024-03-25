package com.lucle.myp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lucle.myp.domain.MarketVo;
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

    @GetMapping("prlist/large")
    public String listProductsByLarge(@RequestParam("category") int large, Model model) {
        List<MarketVo> products = productService.getProductsByLargeCategory(large);
        model.addAttribute("products", products);
        return "prlist/list-products";
    }

    @GetMapping("prlist/medium")
    public String listProductsByMedium(@RequestParam("category") int medium, Model model) {
        List<MarketVo> products = productService.getProductsByMediumCategory(medium);
        model.addAttribute("products", products);
        return "prlist/list-products";
    }

    @GetMapping("prlist/small")
    public String listProductsBySmall(@RequestParam("category") int small, Model model) {
        List<MarketVo> products = productService.getProductsBySmallCategory(small);
        model.addAttribute("products", products);
        return "prlist/list-products";
    }

    @GetMapping("prlist/sub")
    public String listProductsBySub(@RequestParam("category") int sub_category, Model model) {
        List<MarketVo> products = productService.getProductsBySubCategory(sub_category);
        model.addAttribute("products", products);
        return "prlist/list-products";
    }
    
    @GetMapping("/list-categories")
    public String listCategories() {
        return "/prlist/list-categories";
    }
}