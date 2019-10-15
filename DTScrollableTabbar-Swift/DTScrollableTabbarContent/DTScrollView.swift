//
//  DTScrollView.swift
//  DTSrollableTabBar-Swift
//
//  Created by Dhaval Trivedi on 10/12/19.
//  Copyright © 2019 Dhaval Trivedi. All rights reserved.
//

import UIKit

class DTScrollView: UIScrollView {
    
    //MARK: - Variables
    
    var btnView: DTButtonView?
    var btnViewWidthConstraint: CGFloat = 0.0
    var objAttributes: DTButtonViewAttributes?
    
    //MARK: - View life cycle
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.initializeButtonView()
        self.manageConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        delaysContentTouches = false
        canCancelContentTouches = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    override func touchesShouldCancel(in view: UIView) -> Bool {
        if view is UIButton {
            return true
        }
        return super.touchesShouldCancel(in: view)
    }
    
    //MARK: - Custom methods
    
    func initializeButtonView() {
        btnView = DTButtonView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        btnView?.objAttributes = objAttributes
        self.addSubview(btnView!)
    }
    
    func manageConstraints() {
        btnView?.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        btnView?.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        btnView?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        btnView?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        btnView?.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0, constant: 0).isActive = true
    }
    
    //This method is for setting the scrollview according to visibililty of button on screen
    func setButtonInRect(nextBtnPostion: CGRect, currentBtnPosition: CGRect) {
        if nextBtnPostion.size.width == 0 {
            //Last button
            setContentOffset(CGPoint(x: (currentBtnPosition.origin.x - (self.frame.size.width - currentBtnPosition.size.width)), y: currentBtnPosition.origin.y), animated: true)
        } else {
            let rect = CGRect(x: contentOffset.x, y: 0, width: frame.size.width, height: frame.size.height)
            if !(rect.contains(nextBtnPostion)) {
                var point = CGPoint.init(x: nextBtnPostion.origin.x - (frame.size.width), y: nextBtnPostion.origin.y)
                if point.x < 0 {
                    point = CGPoint.zero
                }
                setContentOffset(point, animated: true)
            } else if (rect.contains(currentBtnPosition)) {
                //Stay as it is - No scroll needed
            } else {
                setContentOffset(CGPoint.init(x: currentBtnPosition.origin.x, y: currentBtnPosition.origin.y), animated: true)
            }
        }
    }
    
}
