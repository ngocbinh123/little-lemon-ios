//
//  CircleImage.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/4/24.
//

import SwiftUI

struct CircleImage: View {
    var imgUrl : String = ""
    var size : CGFloat = 48
    var body: some View {
        Image(imgUrl)
            .resizable()
            .frame(width: size, height: size)
            .clipShape(Circle())
    }
}

#Preview {
    CircleImage()
}
