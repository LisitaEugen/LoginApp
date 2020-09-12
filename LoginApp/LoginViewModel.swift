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

    /* Phone Positive:
    +42 555.123.4567
    +1-(800)-123-4567
    +7 555 1234567
    +7(926)1234567
    (926) 1234567
    +79261234567
    926 1234567
    9261234567
    1234567
    123-4567
    123-89-01
    495 1234567
    469 123 45 67
    89261234567
    8 (926) 1234567
    926.123.4567
    415-555-1234
    650-555-2345
    (416)555-3456
    202 555 4567
    4035555678
    1 416 555 9292**/

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
