//
//  SearchBar.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/4/24.
//

import SwiftUI
struct SearchBar: View {
    @Binding var searchText : String
    @State var fgColor = Color.white
    @State var bgColor = LiLeColor.primary
    @State private var isSearchActive = false
    var body: some View {
        HStack {
            if isSearchActive {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(bgColor)
                    TextField("Search menu", text: $searchText)
                        .onChange(of: searchText) { oldText, newText in
                            print("typing : \(newText)")
                        }
                        .foregroundColor(bgColor)
                        .autocapitalization(.none)
                    CircleButton(iconName: "xmark.circle.fill", pading: 0) {
                        searchText = ""
                        isSearchActive = false
                        hideKeyboard()
                    }
                }
                .padding(8)
                .background(fgColor)
                .cornerRadius(8)

            } else {
                CircleButton(iconName: "magnifyingglass") {
                    isSearchActive = true
                }

            }
            Spacer()
        }
        .padding()
        .background(bgColor)
    }

    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


#Preview {
    SearchBar(searchText: .constant(""))
}
