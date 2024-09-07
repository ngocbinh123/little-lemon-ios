//
//  OnboardingHeader.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/3/24.
//

import SwiftUI

struct OBHeroSection: View {
    var body: some View {
        HStack {
            VStack {
                Text("Little lemon")
                    .foregroundColor(LiLeColor.secondary)
                    .font(Font.displayFont())
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Text("Chicago")
                    .foregroundColor(Color.white)
                    .font(Font.subTitleFont())
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                    .padding(.top, 8)
                    .foregroundColor(Color.white)
                    .font(Font.leadText())
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            Image("img_hero")
                .resizable()
                .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 120, maxHeight: 140)
                .cornerRadius(16.0)
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
        .background(LiLeColor.primary)
    }
}

#Preview {
    OBHeroSection()
}
