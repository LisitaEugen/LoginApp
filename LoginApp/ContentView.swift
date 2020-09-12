//
//  ContentView.swift
//  LoginApp
//
//  Created by Evgheni Lisita on 12.09.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var phoneNumber = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 20.0) {
            TextField("First Name", text: $firstName)
            TextField("Last Name", text: $firstName)
            TextField("E-mail", text: $firstName)
            TextField("Phone number", text: $firstName)
            Spacer()
        }.padding(EdgeInsets(top: 50, leading: 20, bottom: 30, trailing: 20))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
