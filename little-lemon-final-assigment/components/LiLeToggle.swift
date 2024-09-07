//
//  LiLeToggle.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/7/24.
//

import Foundation
import SwiftUI

struct LiLeToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
            }
        }
        .foregroundColor(LiLeColor.primary)
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background {
            if configuration.isOn {
                LiLeColor.highlight
            }
        }
        .cornerRadius(8)
    }
}
