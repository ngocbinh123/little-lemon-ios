import Foundation
import CoreData
import Combine

public let kFirstName = "first name"
public let kLastName = "last name"
public let kEmail = "e-mail"
public let kPhoneNumber = "phone number"

public let kOrderStatuses = "order statuses"
public let kPasswordChanges = "password changes"
public let kSpecialOffers = "special offers"
public let kNewsletter = "news letter"

class ViewModel: ObservableObject {
    @Published var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @Published var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @Published var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @Published var phoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber) ?? ""

    @Published var orderStatuses = UserDefaults.standard.bool(forKey: kOrderStatuses)
    @Published var passwordChanges = UserDefaults.standard.bool(forKey: kPasswordChanges)
    @Published var specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
    @Published var newsletter = UserDefaults.standard.bool(forKey: kNewsletter)


    @Published var errorMessageShow = false
    @Published var errorMessage = ""

    @Published var searchText = ""
    @Published var shouldShowOnboarding = false

    @Published var saveChangeSuccess = false

    func clearCachedData() {
        errorMessageShow = false
        errorMessage = ""

        searchText = ""
        shouldShowOnboarding = false
        UserDefaults.standard.set("", forKey: kFirstName)
        UserDefaults.standard.set("", forKey: kLastName)
        UserDefaults.standard.set("", forKey: kEmail)
        UserDefaults.standard.set("", forKey: kPhoneNumber)
        UserDefaults.standard.set(false, forKey: kOrderStatuses)
        UserDefaults.standard.set(false, forKey: kPasswordChanges)
        UserDefaults.standard.set(false, forKey: kSpecialOffers)
        UserDefaults.standard.set(false, forKey: kNewsletter)
    }

    func checkOnboardingStatus() {
        if email.isEmpty || !isValidEmail(email) {
            shouldShowOnboarding = true
        } else {
            shouldShowOnboarding = false
        }
    }

    func saveProfileInfo(email : String, firstName : String, lastName: String, phone : String,
                         orderStatus: Bool, passwordChange: Bool, specialOffer: Bool, newsletter: Bool) {
        if validOnBoardingInfo(email: email, firstName: firstName, lastName: lastName) && isValidPhoneNumber(phone) {
            saveNotificationState(orderStatus: orderStatus, passwordChange: passwordChange, specialOffer: specialOffer, newsletter: newsletter)
            saveOnBoardingInfo(email: email, firstName: firstName, lastName: lastName)
            UserDefaults.standard.set(phone, forKey: kPhoneNumber)
            saveChangeSuccess = true
        }
    }

    func saveOnBoardingInfo(email : String, firstName : String, lastName: String) {
        UserDefaults.standard.set(firstName, forKey: kFirstName)
        UserDefaults.standard.set(lastName, forKey: kLastName)
        UserDefaults.standard.set(email, forKey: kEmail)
    }

    func validProfileInfo(email : String, firstName : String, lastName: String, phone : String) -> Bool {
        return validOnBoardingInfo(email: email, firstName: firstName, lastName: lastName) && isValidPhoneNumber(phone)
    }


    func validOnBoardingInfo(email : String, firstName : String, lastName: String) -> Bool {
        var allValid = true
        errorMessage = ""

        if !isValidEmail(email) {
            errorMessage = "Email is invalid"
            allValid = false
        } else if !isValidName(firstName, lbl: "First") {
            allValid = false
        } else if !isValidName(lastName, lbl: "Last") {
            allValid = false
        }
        errorMessageShow = !allValid
        return allValid
    }

    func getMenuData(viewContext: NSManagedObjectContext) {
        PersistenceController.shared.clear()

        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let fullMenu = try? decoder.decode(MenuList.self, from: data) {
                    for dish in fullMenu.menu {
                        let newDish = Dish(context: viewContext)
                        newDish.title = dish.title
                        newDish.price = dish.price
                        newDish.descriptionDish = dish.descriptionDish
                        newDish.image = dish.image
                        newDish.category = dish.category
                    }
                    try? viewContext.save()
                } else {
                    print(error.debugDescription.description)
                }
            } else {
                print(error.debugDescription.description)
            }
        }
        dataTask.resume()
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    private func isValidName(_ name: String, lbl : String) -> Bool {
        errorMessage = ""
        // Check if the name is empty
        if name.isEmpty {
            errorMessage = "\(lbl) Name cannot be empty."
        }

        // Check if the name contains only alphabetic characters
        let validCharacters = CharacterSet.letters.union(CharacterSet.whitespaces)
        if name.rangeOfCharacter(from: validCharacters.inverted) != nil {
            errorMessage = "\(lbl) Name must contain only letters."
        }

        // Check if the name length is between 2 and 50 characters
        if name.count < 2 {
            errorMessage = "\(lbl) Name must have at least 2 characters."
        } else if name.count > 50 {
            errorMessage = "\(lbl) Name must not exceed 50 characters."
        }

        errorMessageShow = !errorMessage.isEmpty
        return errorMessage.isEmpty
    }

    private func isValidPhoneNumber(_ newPhoneNumber: String) -> Bool {
        errorMessage = ""
        errorMessageShow = false
        if newPhoneNumber.isEmpty {
            return true
        }
        // Check if phone number starts with "0"
        if !newPhoneNumber.hasPrefix("0") {
            errorMessage = "Phone number must start with 0."
        }

        // Check if phone number has exactly 11 digits
        if newPhoneNumber.count < 8 {
            errorMessage = "Phone number must have least 9 digits."
        }

        if newPhoneNumber.count > 11 {
            errorMessage = "Phone number must under or equals 11 digits."
        }

        // Check if the phone number contains only digits
        let validCharacters = CharacterSet.decimalDigits
        if newPhoneNumber.rangeOfCharacter(from: validCharacters.inverted) != nil {
            errorMessage = "Phone number must contain only digits."
        }

        errorMessageShow = !errorMessage.isEmpty
        return errorMessage.isEmpty
    }

    private func saveNotificationState(orderStatus : Bool, passwordChange: Bool, specialOffer: Bool, newsletter : Bool) {
        UserDefaults.standard.set(orderStatus, forKey: kOrderStatuses)
        UserDefaults.standard.set(passwordChange, forKey: kPasswordChanges)
        UserDefaults.standard.set(specialOffer, forKey: kSpecialOffers)
        UserDefaults.standard.set(newsletter, forKey: kNewsletter)
    }
}
