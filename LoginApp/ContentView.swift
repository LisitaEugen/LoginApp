//
//  ContentView.swift
//  LoginApp
//
//  Created by Evgheni Lisita on 12.09.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 20.0) {
            TextField("First Name", text: $viewModel.firstName)
            TextField("Last Name", text: $viewModel.lastName)
            TextField("E-mail", text: $viewModel.email)
            TextField("Phone number", text: $viewModel.phoneNumber)
            Spacer()
        }.padding(EdgeInsets(top: 50, leading: 20, bottom: 30, trailing: 20))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
