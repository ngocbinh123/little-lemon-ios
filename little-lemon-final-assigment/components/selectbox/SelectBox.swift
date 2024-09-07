//
//  SelectBoax.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/6/24.
//

import SwiftUI

struct SelectBox: View {
    @State var name : String
    @State var selected : Bool = true
//    var action : (_ isSelected : Bool) -> Void
    var body: some View {
        VStack {
            Text(name)
                .font(.sectionCategories())
                .foregroundColor(LiLeColor.primary)
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
        .frame(minWidth: 80, minHeight: 40) // Size of each box
        .background(selected ? LiLeColor.highlight : Color.white) // Dynamic background
        .cornerRadius(8)
        .onTapGesture {
            selected = !selected
        }
    }
}

#Preview {
    SelectBox(name: "Starters") 
}
