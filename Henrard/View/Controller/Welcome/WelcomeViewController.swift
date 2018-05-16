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
    @IBOutlet weak var moreInfosButton: UIButton!

    var developerViewModel: DeveloperViewModel? = nil

    let alreadyOpenedKey = "alreadyOpened"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonContinue.round()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let alreadyOpened = UserDefaults.standard.bool(forKey: alreadyOpenedKey)
        if !alreadyOpened {
            UserDefaults.standard.set(true, forKey: alreadyOpenedKey)
            self.showMoreInfos()
        }
    }
    
    @IBAction func touchUpButtonContinue(_ sender: Any) {
        buttonContinue.showLoading()

        let service = Service()
        service.authenticate(authentication: Session.shared.authentication) { code, sessionIsActive in
            if sessionIsActive {
                self.developerViewModel = DeveloperViewModel(byId: 1) {
                    DispatchQueue.main.async {
                        if let _ = self.developerViewModel, self.developerViewModel!.isFill {
                            self.performSegue(withIdentifier: Segue.welcomeToMain, sender: nil)
                        }
                        self.buttonContinue.hideLoading()
                    }
                }
            } else {
                self.buttonContinue.hideLoading()
            }
        }
    }

    @IBAction func touchUpMoreInfosButton(_ sender: Any) {
        self.showMoreInfos()
    }

    private func showMoreInfos() {
        let vc = MoreInfosPopUpController.instance()
        vc.setup()
        PopupController
            .create(self)
            .customize(
                [
                        .animation(.slideUp),
                        .scrollable(true),
                        .backgroundStyle(.blackFilter(alpha: 0.7)),
                        .layout(.bottom)
                ]
            )
            .didShowHandler { popup in

            }
            .didCloseHandler { _ in

            }
            .show(vc)
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
