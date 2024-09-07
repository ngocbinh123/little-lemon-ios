//
//  SectionTitle.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/7/24.
//

import SwiftUI

struct SectionTitle: View {
    var name : String
    var textColor = LiLeColor.primary
    var textAlignment : Alignment = .leading
    var body: some View {
        Text(name)
            .foregroundStyle(textColor)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: textAlignment)
    }
}

#Preview {
    SectionTitle(name: "Avatar")
}
