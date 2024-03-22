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

import com.lucle.myp.domain.MarketVo;
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

    @GetMapping("/large")
    public String getLargeCategories(Model model) {
        // 여기서는 예시로 모든 대분류를 가져오는 로직을 가정합니다.
        // 실제로는 서비스 계층에서 대분류 목록을 반환하는 메소드를 호출해야 합니다.
        List<MarketVo> largeCategories = productService.getCategoriesByLarge(0); // 0은 모든 대분류를 의미
        model.addAttribute("largeCategories", largeCategories);
        return "/prlist/categorySelection";
    }

    @GetMapping("/medium")
    public String getMediumCategories(@RequestParam("large") int large, Model model) {
        List<MarketVo> mediumCategories = productService.getCategoriesByMedium(large, 0); // 0은 해당 대분류의 모든 중분류를 의미
        model.addAttribute("mediumCategories", mediumCategories);
        return "/prlist/categorySelection";
    }

    @GetMapping("/small")
    public String getSmallCategories(@RequestParam("large") int large,
                                     @RequestParam("medium") int medium, Model model) {
        List<MarketVo> smallCategories = productService.getCategoriesBySmall(large, medium, 0); // 0은 해당 중분류의 모든 소분류를 의미
        model.addAttribute("smallCategories", smallCategories);
        return "/prlist/categorySelection";
    }

    @GetMapping("/sub")
    public String getSubCategories(@RequestParam("large") int large,
                                   @RequestParam("medium") int medium,
                                   @RequestParam("small") int small, Model model) {
        List<MarketVo> subCategories = productService.getCategoriesBySub(large, medium, small, 0); // 0은 해당 소분류의 모든 세부분류를 의미
        model.addAttribute("subCategories", subCategories);
        return "/prlist/categorySelection";
    }

    @GetMapping("/select")
    public String showCategorySelection() {
        return "prlist/categorySelection"; // categorySelection.jsp로 이동
    }
}
