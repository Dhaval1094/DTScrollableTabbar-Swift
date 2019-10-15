//
//  DTButtonViewAttributes.swift
//  DTSrollableTabBar-Swift
//
//  Created by Dhaval Trivedi on 10/13/19.
//  Copyright © 2019 Dhaval Trivedi. All rights reserved.
//

import UIKit

//This class defines the attributes of the contents of the tabbar.
//It can be change in between the app running and set with refrashing the tabbar.

class DTButtonViewAttributes: NSObject {

    var arrButtonTitles = [String]()                 // Pass array of button titles
    var btnColor: UIColor?                           // Button's background color
    var stripColor: UIColor?                         // Strip background color
    var btnTextColor: UIColor?                       // Button's text color
    var stripHeight: CGFloat = 0.0                   // Strip's height
    var btnFont = UIFont()                           // Font type for the button
    var setPading: CGFloat = 0.0                     // Pading (Left-Right insets) for the button title
    var setBoarderWidth: CGFloat = 0.0               // Border width for the button
    var setBoarderColor: UIColor?                    // Border color for the button
    var setByMaxButtonTitle = false                  // Set fix width for the button
    var fitToTheScreenWidth = false                  // Set scrollview content fit to the screen size and devide equally
    
    override init() {
        super.init()
        btnColor = UIColor.white
        stripColor = UIColor.yellow
        btnTextColor = UIColor.black
        setBoarderColor = UIColor.darkGray
        btnFont = UIFont.systemFont(ofSize: 15.0)
    }
    
}
