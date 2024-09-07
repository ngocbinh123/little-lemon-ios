//
//  LiLeButton.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/4/24.
//

import SwiftUI

struct primaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .white : .black)
            .padding(10)
            .background(configuration.isPressed ? LiLeColor.primary : LiLeColor.secondary)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct secondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? LiLeColor.primary : .white)
            .padding(10)
            .background(configuration.isPressed ? .white : LiLeColor.primary)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(LiLeColor.primary, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

struct reversePrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .white : LiLeColor.primary)
            .padding(10)
            .background(configuration.isPressed ? LiLeColor.primary : .white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(LiLeColor.primary, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

struct ButtonToggleStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .white : LiLeColor.primary)
            .padding(10)
            .background(configuration.isPressed ? LiLeColor.primary : .white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(LiLeColor.primary, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}
