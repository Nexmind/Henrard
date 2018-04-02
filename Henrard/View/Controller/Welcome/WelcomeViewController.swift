//
//  WelcomeViewController.swift
//  henrard
//
//  Created by Julien Henrard on 27/03/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var imgWelcome: UIImageView!
    @IBOutlet weak var lblHello: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var buttonContinue: LoadingButton!

    var developerViewModel: DeveloperViewModel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonContinue.round()
    }
    @IBAction func touchUpButtonContinue(_ sender: Any) {
        buttonContinue.showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(0), execute: {
            self.developerViewModel = DeveloperViewModel(byId: 1) {
                DispatchQueue.main.async {
                    if self.developerViewModel != nil {
                        self.performSegue(withIdentifier: Segue.welcomeToMain, sender: nil)
                    }
                }
            }
        })
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.welcomeToMain, let developerViewModel = self.developerViewModel {
            let vc = segue.destination as! MainViewController
            vc.modalTransitionStyle = .crossDissolve
            vc.developerViewModel = developerViewModel
            self.present(vc, animated: true, completion: nil)
        }
    }
}
