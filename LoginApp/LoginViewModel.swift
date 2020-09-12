//
//  LoginViewModel.swift
//  LoginApp
//
//  Created by Evgheni Lisita on 12.09.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var phoneNumber = ""
}

extension String {
    private var emailRegex: String { "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}" }
    private var phoneRegex: String { "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$" }

    private func matches(_ regex: String ) -> Bool {
        var isValid = true
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self, range: NSRange(location: 0, length: self.count))

            if results.count == 0 {
            isValid = false
            }
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            isValid = false
        }

        return  isValid
    }

    var isValidFirstName: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "([A-Z])\\w+").evaluate(with: self)
    }

    var isValidLastName: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "([A-Z])\\w+").evaluate(with: self)
    }

    var isValidEmail: Bool {
        matches(emailRegex)
    }

    var isValidPhoneNumber: Bool {
        matches(phoneRegex)
    }
}
