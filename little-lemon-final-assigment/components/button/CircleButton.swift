//
//  CircleIcon.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/5/24.
//

import SwiftUI

struct CircleButton: View {
    var iconName : String
    var size : CGFloat = 16
    var pading : CGFloat = 8
    var action: () -> Void
    var bgColor = Color.white
    var fgColor = LiLeColor.primary
    var body: some View {
        Button(action: action, label: {
            Image(systemName: iconName)
                .resizable()
                .frame(width: size, height: size)
                .padding(pading)
                .foregroundColor(fgColor)
                .background(bgColor)
                .clipShape(Circle())
        })
    }
}

#Preview {
    CircleButton(iconName: "magnifyingglass") {

    }
}
