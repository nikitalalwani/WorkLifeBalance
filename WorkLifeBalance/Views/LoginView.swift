//
//  LoginView.swift
//  WorkLifeBalance
//
//  Created by nikita lalwani on 4/11/19.
//  Copyright © 2019 nikita lalwani. All rights reserved.
//

import UIKit

class LoginView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var btnForgot: UIView!
    
    override func awakeFromNib() {
        
      self.backgroundColor = UIColor(patternImage: UIImage(named: "background.png") ?? UIImage())
      self.btnForgot.layer.cornerRadius = 12
      self.contentView.layer.cornerRadius = self.contentView.frame.width/4
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("LoginView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }
}
