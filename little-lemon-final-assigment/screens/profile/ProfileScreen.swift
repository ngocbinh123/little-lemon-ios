//
//  ProfileScreen.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/7/24.
//

import SwiftUI

struct ProfileScreen: View {
    @StateObject private var viewModel = ViewModel()

    @Environment(\.presentationMode) var presentation

    @State private var orderStatuses = false
    @State private var passwordChanges = false
    @State private var specialOffers = false
    @State private var newsletter = false

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phoneNumber = ""

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {

                SectionTitle(name:"Avatar")
                    .padding(.top, 8)
                ProfileHeader()

                InputTextWithLabelView(inputValue: $firstName, lbl: .constant("First name"))
                InputTextWithLabelView(inputValue: $lastName, lbl: .constant("Last name"))
                InputTextWithLabelView(inputValue: $email, lbl: .constant("E-mail"))
                InputTextWithLabelView(inputValue: $phoneNumber, lbl: .constant("Phone number"), isRequired: false, keyBoardType : .numberPad)

                if viewModel.errorMessageShow {
                    withAnimation() {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                    }
                }

                SectionTitle(name:"Email Notification", textAlignment: .center).padding(.top)
                VStack {
                    Toggle("Order statuses", isOn: $orderStatuses)
                    Toggle("Password changes", isOn: $passwordChanges)
                    Toggle("Special offers", isOn: $specialOffers)
                    Toggle("Newsletter", isOn: $newsletter)
                }
                .padding()
                .font(Font.leadText())
                .foregroundColor(LiLeColor.primary)
                Spacer()
                Button("Logout", action: onLogout)
                    .buttonStyle(primaryButtonStyle())
                Spacer(minLength: 8)
                ProfileFooter(discardAction: onDiscardChanges, saveAction: onSaveChanges)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
        .onAppear {
            showCachedDataOnUI()
        }
        .navigationTitle(Text("Personal information"))
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $viewModel.saveChangeSuccess) {
            Alert(title: Text("Success"), message: Text("Your Profile is updated successfully."), dismissButton: .default(Text("OK")))
        }
    }

    private func onDiscardChanges() {
        showCachedDataOnUI()
    }

    private func onSaveChanges() {
        viewModel.saveProfileInfo(email: email, firstName: firstName, lastName: lastName, phone: phoneNumber,
                                  orderStatus: orderStatuses, passwordChange: passwordChanges, specialOffer: specialOffers, newsletter: newsletter)
    }

    private func onLogout() {
        viewModel.clearCachedData()
        navigateToOnBoarding()
    }

    private func navigateToOnBoarding() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                window.rootViewController = UIHostingController(rootView: OnboardingScreen())
                window.makeKeyAndVisible()
            }
        }
    }

    private func showCachedDataOnUI() {
        firstName = viewModel.firstName
        lastName = viewModel.lastName
        email = viewModel.email
        phoneNumber = viewModel.phoneNumber

        orderStatuses = viewModel.orderStatuses
        passwordChanges = viewModel.passwordChanges
        specialOffers = viewModel.passwordChanges
        newsletter = viewModel.newsletter
    }
}

#Preview {
    ProfileScreen()
}
