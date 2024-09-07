//
//  colors.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/3/24.
//


import SwiftUI


struct LiLeColor {
    static let primary = Color(UIColor(hex: 0x495E57))
    static let secondary = Color(UIColor(hex: 0xF4CE14))
    static let highlight = Color(UIColor(hex: 0xEDEFEE))

}

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex >> 16) & 0xFF) / 255.0,
            green: CGFloat((hex >> 8) & 0xFF) / 255.0,
            blue: CGFloat(hex & 0xFF) / 255.0,
            alpha: alpha
        )
    }
}
