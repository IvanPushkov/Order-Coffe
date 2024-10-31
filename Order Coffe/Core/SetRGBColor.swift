//
//  SetRGBColr.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 29.10.2024.
//

import UIKit

extension UIColor{
    static func setRGBColor(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) -> UIColor{
        let color = UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
        return color
    }
}


