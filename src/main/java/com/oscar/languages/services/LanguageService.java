package com.oscar.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.oscar.languages.models.Language;
import com.oscar.languages.repositories.LanguageRepository;

@Service
public class LanguageService {
	private final LanguageRepository langRepo;
	
	public LanguageService(LanguageRepository langRepo) {
		this.langRepo = langRepo;
	}
	
	public List<Language> getAll() {
		return langRepo.findAll();
	}
	
	public Language createLanguage(Language lang) {
		return langRepo.save(lang);
	}
	
	public Language findLanguage(Long id) {
		Optional<Language> optionalLang = langRepo.findById(id);
		if(optionalLang.isPresent()) {
			return optionalLang.get();
		} else {
			return null;
		}
	}
	
	public Language updateLanguage(Long id, String name, String creator, String currentVersion) {
		Language langToUpdate = findLanguage(id);
		langToUpdate.setName(name);
		langToUpdate.setCreator(creator);
		langToUpdate.setCurrentVersion(currentVersion);
		return langRepo.save(langToUpdate);
	}
	
	public void deleteLanguage(Long id) {
		langRepo.deleteById(id);
	}
}
