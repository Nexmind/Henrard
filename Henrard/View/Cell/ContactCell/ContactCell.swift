//
//  ContactCell.swift
//  henrard
//
//  Created by Julien Henrard on 14/05/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit
import MessageUI

class ContactCell: UITableViewCell, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var labelContactMe: UILabel!
    @IBOutlet weak var labelDescription: UILabel!

    @IBOutlet weak var buttonGoToRepository: UIButton!
    @IBOutlet weak var buttonEmail: UIButton!

    let contactEmail = "julien@henrard.co"
    let githubRepo = "https://github.com/Nexmind/Henrard"
    
    var parent: UIViewController? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.midnightBlue
        self.backgroundColor = UIColor.midnightBlue
        self.buttonEmail.setTitleColor(UIColor.carrot, for: .normal)
        self.buttonEmail.setTitle(contactEmail, for: .normal)
        self.buttonGoToRepository.setTitleColor(UIColor.carrot, for: .normal)
        self.selectionStyle = .none
        self.separatorInset = UIEdgeInsetsMake(0, 0, 0, .greatestFiniteMagnitude)
    }

    @IBAction func touchUpGoToRepository(sender: UIButton) {
        if let url = URL(string: githubRepo), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func touchUpEmail(sender: UIButton) {
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients([self.contactEmail])
        mailComposer.setSubject("Contact Me !")
        
        if let parent = self.parent, MFMailComposeViewController.canSendMail() {
            parent.present(mailComposer, animated: true, completion: nil)
        } else {
            self.presentAlert(title: "Email problem", message: "Cannot send email. Please verify that your Mail application is configured")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch(result) {
        case .failed:
            self.presentAlert(title: "Email Failt", message: "An error has occurs when trying to send your email")
            break
        case .sent:
            self.presentAlert(title: "Email sent", message: "Your email has been send")
            break
        case .cancelled:
            controller.dismiss(animated: true, completion: nil)
        case .saved:
            controller.dismiss(animated: true, completion: nil)
        }
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.parent?.present(alert, animated: true, completion: nil)
    }
}
