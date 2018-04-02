//
//  LanguageViewModel.swift
//  henrard
//
//  Created by Julien Henrard on 24/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class LanguageViewModel {
    var language: Language

    init() {
        self.language = Language()
    }

    init(language: Language) {
        self.language = language
    }

    var textLevel: String {
        switch(self.language.level) {
        case .basic: return "I can order my drink"
        case .medium: return "I can read/write & speak on a topic i master"
        case .senior: return "I'm like a native speaker !"
        case .masterRace: return "It's my mother language"
        case .none: return ""
        }
    }
    
    var comment: String {
        return self.language.comment
    }

    var flag: UIImage? {
        switch(self.language.code) {
        case .french: return #imageLiteral(resourceName: "flag_french")
        case .english: return #imageLiteral(resourceName: "flag_english")
        case .dutch: return #imageLiteral(resourceName: "flag_dutch")
        case .spanish: return #imageLiteral(resourceName: "flag_spanish")
        case .none: return nil
        }
    }
}
