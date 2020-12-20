//
//  UIView+Extension.swift
//  Alivecor
//
//  Created by Toyaj Nigam on 20/12/20.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
