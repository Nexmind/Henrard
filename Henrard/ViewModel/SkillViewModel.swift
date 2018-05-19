//
//  SkillViewModel.swift
//  henrard
//
//  Created by Julien Henrard on 19/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class SkillViewModel {
    var skill: Skill

    init() {
        self.skill = Skill()
    }

    init(skill: Skill) {
        self.skill = skill
    }

    var logo: UIImage? {
        switch(self.skill.technology) {
        case .iOS:
            return #imageLiteral(resourceName: "logo_iOS")
        case .android:
            return #imageLiteral(resourceName: "logo_android")
        case .angular:
            return #imageLiteral(resourceName: "logo_angular")
        case .nodeJS:
            return #imageLiteral(resourceName: "logo_node")
        case .jhipster:
            return #imageLiteral(resourceName: "logo_jhipster")
        case .git:
            return #imageLiteral(resourceName: "logo_git")
        case .aws:
            return #imageLiteral(resourceName: "logo_aws")
        case .none:
            return nil
        }
    }

    var colorLevel: UIColor {
        return UIColor.wetAsphalt
    }
    
    var textLevel: String {
        switch(self.skill.level) {
        case .basic: return "Newbie"
        case .medium: return "Not bad"
        case .senior: return "Nice"
        case .masterRace: return "Real expert"
        case .none: return ""
        }
    }
    
    var description: String {
        return self.skill.description
    }

    var name: String {
        return self.skill.title
    }

    var level: Level {
        return self.skill.level
    }
}
