package com.lucle.myp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lucle.myp.domain.MarketVo;
import com.lucle.myp.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

    private final ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("product", new MarketVo());
        return "/product/register";
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
        return "product_list";
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
        return "/product/edit";
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

    // 추가적으로 필요한 요청 처리 메서드를 여기에 구현할 수 있습니다.
}
