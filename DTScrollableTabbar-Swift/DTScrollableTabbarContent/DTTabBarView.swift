//
//  DTContainerView.swift
//  DTSrollableTabBar-Swift
//
//  Created by Dhaval Trivedi on 10/12/19.
//  Copyright © 2019 Dhaval Trivedi. All rights reserved.
//

import UIKit

protocol DTTabBarViewDelegate {
    func tabbarButtonClicked(button: UIButton)
}

class DTTabBarView: UIView {
    
    //MARK: - Variables
    
    var scrollView: DTScrollView?
    var objAttributes: DTButtonViewAttributes?
    var delegate: DTTabBarViewDelegate?
    
    //MARK: - View life cycle
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.initializeScrollView()
        self.manageConstraints()
        self.clipsToBounds = true
    }

    func initializeScrollView() {
        if self.subviews.contains(scrollView ?? UIView()) {
            scrollView?.removeFromSuperview()
            scrollView = nil
        }
        self.scrollView = DTScrollView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        scrollView?.delegate = self
        scrollView?.objAttributes = objAttributes
        self.addSubview(scrollView!)
    }
    
    //Set constraints for scrollview
    func manageConstraints() {
        scrollView?.translatesAutoresizingMaskIntoConstraints = false
        scrollView?.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView?.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.setNeedsLayout()
    }    
    
    //Call this method when you want to change in attributes of current tabbar object. It will make changes with the change in attributes. i.e. Add-remove buttons, change button background colors etc.
    func refrashTabbar() {
        self.setNeedsDisplay()
    }
    
}

extension DTTabBarView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Scrolled")
    }
    
}
