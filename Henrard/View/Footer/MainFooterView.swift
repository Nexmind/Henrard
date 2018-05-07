//
//  MaintFooterView.swift
//  henrard
//
//  Created by Julien Henrard on 6/05/18.
//  Copyright © 2018 nexmind. All rights reserved.
//

import UIKit

class MainFooterView: UIView {
    // MARK: Outlets
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    // MARK: Variables
    var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.frame.size.height = 76
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.leftLabel.text = "Julien Henrard"
        self.rightLabel.text = "© Nexmind, 2018"
        self.leftLabel.textColor = UIColor.cloud
        self.rightLabel.textColor = UIColor.cloud
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: MainFooterView.describe, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.backgroundColor = UIColor.midnightBlue
        return view
    }
}
