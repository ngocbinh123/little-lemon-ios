//
//  InputTextWithLabelView.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/4/24.
//

import SwiftUI

struct InputTextWithLabelView: View {
    @Binding var inputValue: String
    @Binding var lbl: String
    var isRequired: Bool = true // Default value of true
    var keyBoardType = UIKeyboardType.default
    var body: some View {
        VStack {
            Text(isRequired ? "\(lbl) *" : lbl).onboardingTextStyle()
            TextField(lbl, text: $inputValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(keyBoardType)
        }
        .padding([.leading, .trailing], 16)
        .padding(.top, 8)
    }
}

#Preview {
    InputTextWithLabelView(inputValue: .constant("Initial Input"), lbl: .constant("Label"))
}
