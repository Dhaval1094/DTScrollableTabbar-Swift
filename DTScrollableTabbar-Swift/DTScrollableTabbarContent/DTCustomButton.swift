//
//  DTCustomButton.swift
//  DTSrollableTabBar-Swift
//
//  Created by Dhaval Trivedi on 10/14/19.
//  Copyright © 2019 Dhaval Trivedi. All rights reserved.
//

import UIKit

class DTCustomButton: UIButton {

    //MARK: - Variables
    
    var viewContentWidth: CGFloat = 0.0

    //MARK: - View lifecycle
    
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    //MARK: - Custom methods
    
    func setWithObj(attributes: DTButtonViewAttributes) {
        self.setTitleColor(attributes.btnTextColor, for: .normal)
        self.titleLabel?.font = attributes.btnFont
        self.backgroundColor = attributes.btnColor
        self.layer.borderColor = attributes.setBoarderColor?.cgColor
        self.layer.borderWidth = attributes.setBoarderWidth
    }
}
