//
//  ViewController.swift
//  DTSrollableTabBar-Swift
//
//  Created by Dhaval Trivedi on 10/12/19.
//  Copyright © 2019 Dhaval Trivedi. All rights reserved.
//

import UIKit

class DTViewController: UIViewController, DTTabBarViewDelegate {
    
    //MARK: - IBOutlets
    
    @IBOutlet var tabBarViewOne: DTTabBarView!
    @IBOutlet var tabBarViewTwo: DTTabBarView!
    @IBOutlet var tabbarViewThree: DTTabBarView!
    
    //MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self .setupView()
    }
    
    //MARK: - Custom methods
    
    func setupView() {
        tabBarViewOne.delegate = self
        tabBarViewTwo.delegate = self
        tabbarViewThree.delegate = self
        
        setByInterinsicButtonSizeTabbar()
        setFitByMaxButtonTitleSizeTabbar()
        setByFittoTheScreenWidthTabbar()
    }
    
    func setByInterinsicButtonSizeTabbar() {
        let objAttributes = DTButtonViewAttributes()
        objAttributes.arrButtonTitles = ["Apple", "Banana", "Graps", "Watermelon", "Pineapple", "Pomegranate", "Kiwi", "Orange", "Apple", "Banana", "Graps", "Watermelon"]
        objAttributes.btnColor = UIColor.darkGray
        objAttributes.btnFont = UIFont.init(name: "Arial Rounded MT Bold", size: 15) ?? UIFont.systemFont(ofSize: 15)
        objAttributes.stripColor = UIColor.init(white: 0.8, alpha: 1.0)
        objAttributes.btnTextColor = UIColor.white
        objAttributes.setBoarderColor = UIColor.black
        objAttributes.setBoarderWidth = 0.3
        objAttributes.setPading = 15
        objAttributes.fitToTheScreenWidth = false
        objAttributes.setByMaxButtonTitle = false
        objAttributes.stripHeight = 5
        tabBarViewOne.objAttributes = objAttributes
        tabBarViewOne.refrashTabbar()
    }
    
    func setFitByMaxButtonTitleSizeTabbar() {
        let objAttributes = DTButtonViewAttributes()
        objAttributes.arrButtonTitles = ["Apple", "Banana", "Graps", "Watermelon", "Pineapple", "Pomegranate", "Kiwi", "Orange"]
        objAttributes.btnColor = UIColor.white
        objAttributes.btnFont = UIFont.systemFont(ofSize: 12)
        objAttributes.stripColor = UIColor.black
        objAttributes.btnTextColor = UIColor.darkGray
        objAttributes.setBoarderColor = UIColor.lightGray
        objAttributes.setBoarderWidth = 0.5
        objAttributes.setPading = 10
        objAttributes.fitToTheScreenWidth = false
        objAttributes.setByMaxButtonTitle = true
        objAttributes.stripHeight = 5
        tabBarViewTwo.objAttributes = objAttributes
        tabBarViewTwo.refrashTabbar()
    }
    
    func setByFittoTheScreenWidthTabbar() {
        let objAttributes = DTButtonViewAttributes()
        objAttributes.arrButtonTitles = ["First", "Second", "Third", "Fourth" , "Fifth"]
        objAttributes.btnColor = UIColor.blue
        objAttributes.btnFont = UIFont.systemFont(ofSize: 15)
        objAttributes.stripColor = UIColor.lightGray
        objAttributes.btnTextColor = UIColor.white
        objAttributes.setBoarderColor = UIColor.darkGray
        objAttributes.setBoarderWidth = 0.4
        objAttributes.setPading = 10
        objAttributes.fitToTheScreenWidth = true
        objAttributes.setByMaxButtonTitle = true
        objAttributes.stripHeight = 5
        tabbarViewThree.objAttributes = objAttributes
        tabbarViewThree.refrashTabbar()
    }
    
    //MARK: - Button clicked from tabbar
    
    func tabbarButtonClicked(button: UIButton) {
        print(button.titleLabel?.text ?? "")
    }
    
    //MARK: - Other Button actions
    
    @IBAction func clicked(_ sender: Any) {
        tabBarViewTwo.objAttributes?.arrButtonTitles = ["Watermelon", "Pineapple", "Pomegranate", "Kiwi", "Orange"]
        tabBarViewTwo.refrashTabbar()
        
        tabbarViewThree.objAttributes?.arrButtonTitles.append("Sixth")
        tabbarViewThree.refrashTabbar()
    }
}


