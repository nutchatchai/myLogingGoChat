//
//  PaddingTextField.swift
//  myAlamofile
//
//  Created by Nutchatchai on 9/7/2563 BE.
//  Copyright © 2563 Nutchatchai. All rights reserved.
//

import UIKit

class PaddingTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: UIEdgeInsets.init(top:0, left:15, bottom:0, right:15))
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets.init(top:0, left:15, bottom:0, right:15))
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets.init(top:0, left:15, bottom:0, right:15))
    }
}
