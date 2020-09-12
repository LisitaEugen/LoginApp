//
//  ContentView.swift
//  LoginApp
//
//  Created by Evgheni Lisita on 12.09.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 20.0) {
            ValidatedTextField("First Name", text: $viewModel.firstName, valid: true)
            ValidatedTextField("Last Name", text: $viewModel.lastName)
            ValidatedTextField("E-mail", text: $viewModel.email)
            ValidatedTextField("Phone number", text: $viewModel.phoneNumber)
            Spacer()
        }.padding(EdgeInsets(top: 50, leading: 20, bottom: 30, trailing: 20))
    }
}

struct ValidatedTextField: View {
    var name: String
    @Binding var text: String
    var valid: Bool

    init(_ name: String, text: Binding<String>, valid: Bool = false) {
        self.name = name
        self._text = text
        self.valid = valid
    }

    var body: some View {
        HStack{
            TextField(name, text: $text)
            if valid {
                Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
            } else {
                Image(systemName: "exclamationmark.triangle.fill")
                .foregroundColor(.yellow)
            }
        }
    }
}



struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen().environmentObject(LoginViewModel())
    }
}
