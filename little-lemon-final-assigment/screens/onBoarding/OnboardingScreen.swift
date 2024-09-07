//
//  OnboardingScreen.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 8/29/24.
//

import SwiftUI
struct OnboardingScreen: View {
    @StateObject private var viewModel = ViewModel()
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var isShowAlert : Bool = false
    @State private var isNavigateToMain : Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                OBHeroSection()
                Spacer().frame(height: 24)
                InputTextWithLabelView(inputValue: $firstName, lbl: .constant("First Name"))
                InputTextWithLabelView(inputValue: $lastName, lbl: .constant("Last Name"))
                InputTextWithLabelView(inputValue: $email, lbl: .constant("Email"), keyBoardType: .emailAddress)
                Spacer().frame(height: 32)
                Button("Register", action: onClickRegister)
                    .buttonStyle(primaryButtonStyle())
                if viewModel.errorMessageShow {
                    withAnimation() {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                    }
                }
                Spacer()

            }
            .navigationDestination(isPresented: $isNavigateToMain) {
                HomeScreen()
            }
        }
        .disableAutocorrection(true)
        .frame(alignment: .top)

    }

    func onClickRegister() {
        if(viewModel.validOnBoardingInfo(email: email, firstName: firstName, lastName: lastName)) {
            UserDefaults.standard.set(firstName, forKey: kFirstName)
            UserDefaults.standard.set(lastName, forKey: kLastName)
            UserDefaults.standard.set(email, forKey: kEmail)
            isNavigateToMain = true
        }
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func isValidName(_ name: String) -> Bool {
        let nameRegEx = "[A-Z-a-z]{2,50}"
        let namePred = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        return namePred.evaluate(with: name)
    }
}

#Preview {
    OnboardingScreen()
}
