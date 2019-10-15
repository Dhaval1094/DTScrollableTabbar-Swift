//
//  DTStripView.swift
//  DTSrollableTabBar-Swift
//
//  Created by Dhaval Trivedi on 10/12/19.
//  Copyright © 2019 Dhaval Trivedi. All rights reserved.
//

import UIKit

class DTStripView: UIView {

    //MARK: - View life cycle
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.init()
    }
}
