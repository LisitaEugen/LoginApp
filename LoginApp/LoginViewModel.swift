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
