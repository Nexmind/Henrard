//
//  DeveloperViewModel.swift
//  henrard
//
//  Created by Julien Henrard on 19/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class DeveloperViewModel {
    var developer: Developer

    init() {
        developer = Developer()
    }
    init(byId id: Int, completion: @escaping () -> Void) {
        developer = Developer()
        let developerService = DeveloperService()
        developerService.getBy(id: id) { developer, code in
            if code == 200 && developer != nil {
                self.developer = developer!
            }
            completion()
        }
    }
    init(developer: Developer) {
        self.developer = developer
    }
    
    var name: String {
        return developer.name
    }
    
    var age: String {
        return "\(developer.age) year"
    }
    
    var description: String {
        return developer.description
    }
    
    var philosophy: String {
        return developer.philosophy
    }
    
    var skills: [SkillViewModel] {
        var skillsViewModel = [SkillViewModel]()
        self.developer.skills.forEach { skill in
            skillsViewModel.append(SkillViewModel(skill: skill))
        }
        return skillsViewModel
    }
    
    var languages: [LanguageViewModel] {
        var languagesViewModel = [LanguageViewModel]()
        self.developer.languages.forEach { language in
            languagesViewModel.append(LanguageViewModel(language: language))
        }
        return languagesViewModel
    }
    
    var specialityText: String {
        return "Specialized in \(developer.speciality.rawValue) development"
    }
    
    var pictureUrl: URL? {
        return URL(string: developer.picture)
    }
    
    var bannerImage: UIImage? {
        switch (developer.speciality) {
            case .iOS: return #imageLiteral(resourceName: "iOS")
            default: return nil
        }
    }
    
    var isFill: Bool {
        return !(self.developer.id == 0)
    }
    
    
}
