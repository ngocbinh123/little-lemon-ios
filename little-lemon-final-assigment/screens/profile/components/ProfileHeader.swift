//
//  ProfileHeader.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/7/24.
//

import SwiftUI

struct ProfileHeader: View {
    var changeAction : () -> Void = {

    }
    var removeAction : () -> Void = {

    }


    var body: some View {
        HStack {
            CircleImage(imgUrl: "img_profile", size: 80)
            Button("Change", action: changeAction)
                .buttonStyle(secondaryButtonStyle())
            Button("Remove", action: removeAction)
                .buttonStyle(reversePrimaryButtonStyle())
        }
    }
}

#Preview {
    ProfileHeader()
}
