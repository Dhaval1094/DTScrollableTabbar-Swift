# DTScrollableTabbar-Swift

![Screenshot](https://github.com/Dhaval1094/DTScrollableTabbar-Swift/blob/master/Screenshots/Logo/icon_logo.png)

It is simple, light weight and easily manageable scrollable tab bar. It can be used as fixed top bar as well. For using it you have to pass just array of titles and type of tabbar design. It will work on both landscape and portrait mode. -> Swift 5.0. 

The tabbar design is set for mainly these three attributes. You can choose one attribute from them.

* First - dynamic size scrollable tabbar. In this all items(buttons) in the tabbar will be set with the intrinsic label size 		of the button and given pading value. Pading is for spacing on the left and right side of the title of the button.
* Second - max title width size tabbar. In this all items(buttons) in the tabbar will be set as per the maximum button titles 	size and given pading value.
* Third - Fixed tabbar frame size. In this the size of the tabbar view will be fix with the given constraints. So the tabbar 	
	will not be scrollable because the view will be fixed.

![App Functionality](https://github.com/Dhaval1094/DTScrollableTabbar-Swift/blob/master/Screenshots/App_functionality.gif)
	
The layer structure of main tabbar view is showing below.

![Layers](https://github.com/Dhaval1094/DTScrollableTabbar-Swift/blob/master/Screenshots/layers.png)

For managing the design just pass the attributes. The attributes are as follows..

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
    
It could be used in project as folows.

    //Take a UIView object in story board. Set subclass DTTabBarView to it.
    //Then take outlet.
     @IBOutlet var tabBarView: DTTabBarView!
     
     //Assign delegate 
     tabBarView.delegate = self
     
     //Take object of attributes for the content of the tabbar
     let objAttributes = DTButtonViewAttributes()
     
     //Set attributes
        objAttributes.arrButtonTitles = ["Apple", "Banana", "Graps", "Watermelon"]
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
        
      //Assign attributes object to the tabbar view
      tabbarView.objAttributes = objAttributes
      
You can change any attributes or add items at the run time bu the following code.

        tabbarView.objAttributes?.arrButtonTitles.append("Title")
        tabbarView.refrashTabbar()

DTTabBarViewDelegate is used for getting the button action event in the view controller.

        protocol DTTabBarViewDelegate {
           func tabbarButtonClicked(button: UIButton)
        }
        
In the view controller..

        func tabbarButtonClicked(button: UIButton) {
             print(button.titleLabel?.text ?? "")
        }
     
