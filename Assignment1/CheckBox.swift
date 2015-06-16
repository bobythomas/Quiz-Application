//
//  CheckBox.swift
//  Assignment1
//
//  Created by boby thomas on 2015-06-14.
//  Copyright (c) 2015 boby thomas. All rights reserved.
//

import UIKit

class CheckBox: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    // images
    
    let checkedImage = UIImage(named: "checked_checkbox")
    let unCheckedImage = UIImage(named: "unchecked_checkbox")
    
    var isChecked : Bool = false{
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, forState: .Normal)
            }
            else
            {
                self.setImage(unCheckedImage, forState: .Normal)
            }
            
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: "buttonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        isChecked = false
    }
    
    func buttonPressed()
    {
            if isChecked == true{
                isChecked = false
            }
            else{
                isChecked = true
            }
       }

}
