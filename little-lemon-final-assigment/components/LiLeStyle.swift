//
//  LiLeStyle.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/3/24.
//

import SwiftUI

extension Text {
    func onboardingTextStyle() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(LiLeColor.primary)
            .font(.custom("Karla-Bold", size: 13))
    }
}
