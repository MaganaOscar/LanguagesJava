package com.oscar.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oscar.languages.models.Language;
import com.oscar.languages.services.LanguageService;

@Controller
public class LanguagesController {
	private final LanguageService langService;
	
	public LanguagesController(LanguageService langService) {
		this.langService = langService;
	}
	
	@RequestMapping("/languages")
	public String index(@ModelAttribute("language") Language language, Model model) {
		List<Language> langs = langService.getAll();
		model.addAttribute("languages", langs);
		return "index.jsp";
	}
	
	@RequestMapping(value="/languages", method=RequestMethod.POST)
	public String create(@Valid @ModelAttribute("language") Language language, BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<Language> langs = langService.getAll();
			model.addAttribute("languages", langs);
			return "index.jsp";
		} else {
			langService.createLanguage(language);
			return "redirect:/languages";
		}
	}
	
	@RequestMapping("/languages/{id}")
	public String show(@PathVariable("id") String id, Model model) {
		Language lang = langService.findLanguage(Long.parseLong(id));
		model.addAttribute("language", lang);
		return "show.jsp";
	}
	
	@RequestMapping("/languages/{id}/edit")
	public String edit(@PathVariable("id") String id, Model model) {
		Language lang = langService.findLanguage(Long.parseLong(id));
		model.addAttribute("language", lang);
		return "edit.jsp";
	}
	
	@RequestMapping(value="/languages/{id}", method=RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("language") Language language, BindingResult result, @PathVariable("id") String id, Model model ) {
		if(result.hasErrors()) {
			return "edit.jsp";
		} else {
			langService.updateLanguage(Long.parseLong(id), language.getName(), language.getCreator(), language.getCurrentVersion());
			return "redirect:/languages/" + id;
		}
	}
	
	@RequestMapping(value="/languages/{id}", method=RequestMethod.DELETE)
	public String destroy(@PathVariable("id") String id) {
		langService.deleteLanguage(Long.parseLong(id));
		return "redirect:/languages";
	}
	
}
