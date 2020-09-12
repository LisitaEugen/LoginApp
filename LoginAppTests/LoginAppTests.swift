//
//  LoginAppTests.swift
//  LoginAppTests
//
//  Created by Evgheni Lisita on 12.09.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import XCTest
@testable import LoginApp

class LoginAppTests: XCTestCase {

    func testFirstNameCapitalLetter() throws {
        let viewModel = LoginViewModel()

        viewModel.firstName = "Myvalidfname"
        XCTAssertTrue(viewModel.firstName.isValidFirstName)

        viewModel.firstName = "myinvalidfname"
        XCTAssertFalse(viewModel.firstName.isValidFirstName)

        viewModel.firstName = ""
        XCTAssertFalse(viewModel.firstName.isValidFirstName)
    }

    func testLastNameCapitalLetter() throws {
        let viewModel = LoginViewModel()

        viewModel.lastName = "Myvalidlname"
        XCTAssertTrue(viewModel.lastName.isValidLastName)

        viewModel.lastName = "myinvalidlname"
        XCTAssertFalse(viewModel.lastName.isValidLastName)

        viewModel.lastName = ""
        XCTAssertFalse(viewModel.lastName.isValidLastName)
    }

    func testValidEmailAddress() throws {
        let viewModel = LoginViewModel()

        viewModel.email = "my@email.com"
        XCTAssertTrue(viewModel.email.isValidEmail)

        viewModel.email = "myin@me.s"
        XCTAssertFalse(viewModel.email.isValidEmail)

        viewModel.email = ""
        XCTAssertFalse(viewModel.email.isValidEmail)
    }

    func testValidPhoneNumber() throws {
        let viewModel = LoginViewModel()

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

        viewModel.phoneNumber = "+7(926)1234567"
        XCTAssertTrue(viewModel.phoneNumber.isValidPhoneNumber)

        viewModel.phoneNumber = "234ff2345"
        XCTAssertFalse(viewModel.phoneNumber.isValidPhoneNumber)
    }
}
