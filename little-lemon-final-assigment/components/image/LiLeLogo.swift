//
//  LiLeLogo.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/4/24.
//

import SwiftUI

struct LiLeLogo: View {
    var height : CGFloat = 32
    var body: some View {
        Image("img_logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: height)
    }
}

#Preview {
    LiLeLogo()
}
