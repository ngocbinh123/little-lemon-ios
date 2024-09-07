//
//  HomeHeader.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/4/24.
//

import SwiftUI

struct HomeHeader: View {
    @State var isLoggedIn = true
    var body: some View {
        ZStack {
            LiLeLogo()
            if(isLoggedIn) {
                HStack {
                    Spacer()
                    NavigationLink(destination: ProfileScreen()) {
                        CircleImage(imgUrl: "img_profile")
                    }
                }.padding()
            }
        }
    }
}

#Preview {
    HomeHeader()
}
