//
//  ProfileFooter.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/7/24.
//

import SwiftUI

struct ProfileFooter: View {
    var discardAction : () -> Void = {

    }

    var saveAction : () -> Void = {

    }
    
    var body: some View {
        HStack(spacing: 16) {
            Button("Discard Changes", action: discardAction)
                .buttonStyle(reversePrimaryButtonStyle())
                .frame(minWidth: 0, maxWidth: .infinity)

            Button("Save Changes", action: saveAction)
                .buttonStyle(secondaryButtonStyle())
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    ProfileFooter()
}
