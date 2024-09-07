//
//  MenuBreakdown.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/4/24.
//

import SwiftUI

struct MenuBreakdown: View {
    @State var startersIsEnabled = true
    @State var mainsIsEnabled = true
    @State var dessertsIsEnabled = true
    @State var drinksIsEnabled = true

    let names = ["Starters", "Mains", "Desserts", "Drinks"] // Array of names

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Order for Delivery")
                .font(.sectionTitle())
                .padding([.horizontal], 16)

            // HStack for the Name Boxes
            HStack(spacing: 8) {
                VStack {
                    Text("Starters")
                        .font(.sectionCategories())
                        .foregroundColor(LiLeColor.primary)
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .frame(minWidth: 80, minHeight: 40) // Size of each box
                .background(mainsIsEnabled ? LiLeColor.highlight : Color.white) // Dynamic background
                .cornerRadius(8)
                .onTapGesture {
                    mainsIsEnabled = !mainsIsEnabled
                }
//                SelectBox(name: "Starters", selected: startersIsEnabled)
//                SelectBox(name: "Mains", selected: mainsIsEnabled)
//                SelectBox(name: "Desserts", selected: dessertsIsEnabled)
//                SelectBox(name: "Drinks", selected: drinksIsEnabled)
//                ForEach(names, id: \.self) { name in
//                    SelectBox(name: name, selected: startersIsEnabled) { isSelected in
//
//                    }
//                }
            }
            .padding(.horizontal, 16) // Padding for the entire row
        }
        .padding(.vertical, 16) // Padding for the entire VStack
    }
}

#Preview {
    MenuBreakdown()
}
