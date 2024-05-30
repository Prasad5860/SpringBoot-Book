package com.example.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.rest.model.Book;
import com.example.rest.model.User;
import com.example.rest.repository.AppRepository;

@Controller
public class AppController {

	@Autowired
	private AppRepository AppRepository;

	@RequestMapping("/")
	public String getHome(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		System.out.println("Entered");
		return "home";
	}

	@PostMapping("/login")
	@ResponseBody
	public ResponseEntity<String> getIndex(@RequestBody User user) {
		System.out.println("login...");
		if (AppRepository.check(user)) {
			return ResponseEntity.ok("success");
		} else {
			return ResponseEntity.status(401).body("Invalid username or password");
		}
	}

	@GetMapping("/display")
	public String dispaly(@ModelAttribute User user) {
		return "display";
	}

	@GetMapping("/getbook")
	@ResponseBody
	public List<Book> getBooks() {
		return AppRepository.getAllBooks();
	}

	@GetMapping("/edit/{id}")
	public String edit(@PathVariable Long id, Model model) {
		Book book = AppRepository.getbyId(id);
		model.addAttribute("book", book);
		return "editform";

	}

	@PostMapping("edit/updateBook")
	public String update(@ModelAttribute Book book) {
		AppRepository.update(book);
		return "redirect:/display";
	}

	@GetMapping("delete/{id}")
	public String delete(@PathVariable Long id) {
		AppRepository.delete(id);
		return "redirect:/display";
	}

	@GetMapping("add")
	public String open(Model model) {
		Book book = new Book();
		model.addAttribute("book", book);
		return "bookform";
	}

	@PostMapping("insert")
	public String add(@ModelAttribute Book book) {
		AppRepository.insert(book);
		return "redirect:/display";
	}

}
