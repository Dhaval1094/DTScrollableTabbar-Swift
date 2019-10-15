//
//  DTButtonView.swift
//  DTSrollableTabBar-Swift
//
//  Created by Dhaval Trivedi on 10/12/19.
//  Copyright © 2019 Dhaval Trivedi. All rights reserved.
//

import UIKit

class DTButtonView: UIView {
    
    //MARK: - Variables
    
    var objAttributes: DTButtonViewAttributes?
    var viewContentWidth: CGFloat = 0.0
    var arrCustomButtons = [DTCustomButton]()
    let stripView = DTStripView()
    var objStackView = UIStackView()
    
    //MARK: - View life cycle
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        for aView in subviews {
            aView.removeFromSuperview()
        }
        for objCst in constraints {
            self.removeConstraint(objCst)
        }
        if objAttributes?.setByMaxButtonTitle ?? false {
            setByMaxButtonTitleSize()
        } else {
            setByAllButtonIntrinsicTitleSize()
        }
        if objAttributes?.fitToTheScreenWidth ?? false {
            setConstraintsForFixWidth()
        } else {
            setConstraintsForDynamicWidth()
        }
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.init()
    }

    //MARK: - Custom methods
    
    func setupView() {
        self.backgroundColor = UIColor.red
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setConstraintsForDynamicWidth() {
        var prevBtnWidth = 0.0
        var i = 0
        for btn in arrCustomButtons {
            btn.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            btn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(prevBtnWidth))
            btn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: btn.frame.size.width / viewContentWidth).isActive = true
            btn.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0).isActive = true
            if (i == 0) {
                addStripView(btn: btn)
            }
            i = i + 1
            prevBtnWidth = prevBtnWidth + Double(btn.frame.size.width)
        }
    }
    
    //This method fits the scroll content view with the screen size and split all buttons equally with the stackview.
    func setConstraintsForFixWidth() {
        let aStackView = stackView
        self.addSubview(aStackView)
        aStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        aStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        aStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        aStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        let widthMultiplier: CGFloat = (1.0 / CGFloat(arrCustomButtons.count))
        var i = 0
        for btn in arrCustomButtons {
            aStackView.addArrangedSubview(btn)
            btn.heightAnchor.constraint(equalTo: aStackView.heightAnchor, multiplier: 1.0).isActive = true
            btn.widthAnchor.constraint(equalTo: aStackView.widthAnchor, multiplier: widthMultiplier).isActive = true
            if (i == 0) {
                 addStripView(btn: btn)
            }
            i = i + 1
        }
        objStackView = aStackView
    }
    
    var stackView: UIStackView {
        let aStackView = UIStackView(frame: self.frame)
        aStackView.axis = .horizontal
        aStackView.distribution = .equalSpacing
        aStackView.alignment = .center
        aStackView.spacing = 0
        aStackView.backgroundColor = .clear
        return aStackView
    }

    //This method add the strip(bottom moving line of the button)
    func addStripView(btn: DTCustomButton) {
        if objAttributes?.fitToTheScreenWidth ?? false {
            stripView.frame = CGRect.init(x: 0, y: self.frame.size.height - (objAttributes?.stripHeight ?? 0), width: (self.frame.size.width / CGFloat(arrCustomButtons.count)), height: objAttributes?.stripHeight ?? 0.0)
        } else {
            stripView.frame = CGRect.init(x: 0, y: self.frame.size.height - (objAttributes?.stripHeight ?? 0), width: btn.frame.size.width, height: objAttributes?.stripHeight ?? 0.0)
        }
        stripView.backgroundColor = objAttributes?.stripColor
        self.addSubview(stripView)
    }
    
    //This method sets all buttons with their intrinsic title label size and given pading.
    func setByAllButtonIntrinsicTitleSize() {
        if let arrTitles = objAttributes?.arrButtonTitles {
            viewContentWidth = 0.0
            for obj in arrTitles {
                //print("title:", obj)
                let button = DTCustomButton()
                button.addTarget(self, action:#selector(ButtonAction(_:)), for: .touchUpInside)
                button.setTitle(obj, for: .normal)
                let pading = (objAttributes?.setPading ?? 0)
                let width = (button.titleLabel?.intrinsicContentSize.width ?? 0) + pading
                button.frame = CGRect.init(x: viewContentWidth, y: 0, width: width, height: self.frame.size.height)
                print("objBtn: ", button)
                button.setWithObj(attributes: objAttributes!)
                arrCustomButtons.append(button)
                self.addSubview(button)
                viewContentWidth = viewContentWidth + width
            }
        }
    }
    
    //This method sets all buttons with respective the maximum button title size and given pading.
    func setByMaxButtonTitleSize() {
        if let arrTitles = objAttributes?.arrButtonTitles {
            var maxBtn = DTCustomButton()
            var maxLength: Int = 0
            for obj in arrTitles {
                if obj.count > maxLength {
                    maxLength = obj.count
                    maxBtn = DTCustomButton()
                    maxBtn.setTitle(obj, for: .normal)
                    maxBtn.frame = CGRect.init(x: 0, y: 0, width: (maxBtn.titleLabel?.intrinsicContentSize.width) ?? 0.0, height: self.frame.size.height)
                }
            }
            viewContentWidth = 0.0
            let width: CGFloat = maxBtn.frame.size.width
            for obj in arrTitles {
                let button = DTCustomButton()
                button.addTarget(self, action:#selector(ButtonAction(_:)), for: .touchUpInside)
                button.setTitle(obj, for: .normal)
                let pading = (objAttributes?.setPading ?? 0)
                button.frame = CGRect(x: viewContentWidth, y: 0, width: width + pading, height: self.frame.size.height)
                button.setWithObj(attributes: objAttributes!)
                arrCustomButtons.append(button)
                self.addSubview(button)
                viewContentWidth = viewContentWidth + width + (objAttributes?.setPading ?? 0)
            }
        }
    }
    
    //MARK: - Button clicked
    
    @objc func ButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.stripView.frame = CGRect(x: sender.frame.origin.x, y: self.frame.size.height - (self.objAttributes?.stripHeight ?? 0), width: sender.frame.size.width, height: self.objAttributes?.stripHeight ?? 0.0)
            self.layoutIfNeeded()
        }
        for i in 0...arrCustomButtons.count - 1 {
            if sender == arrCustomButtons[i] {
                var btnNext = DTCustomButton()
                if !(i == arrCustomButtons.count - 1) {
                    btnNext = arrCustomButtons[i + 1]
                }
                if let scrollView = self.superview as? DTScrollView {
                    scrollView.setButtonInRect(nextBtnPostion: btnNext.frame, currentBtnPosition: sender.frame)
                }
            }
        }
        
        if let tabbarView = self.superview?.superview as? DTTabBarView {
            tabbarView.delegate?.tabbarButtonClicked(button: sender)
        }
    }
}
