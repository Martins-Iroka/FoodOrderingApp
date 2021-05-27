//
//  LoginSignUp.swift
//  iosApp
//
//  Created by Martins on 5/25/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI

struct LoginSignUp: View {
    
    @State var showLine1 = true
    @State var showLine2 = false
    @State var email = ""
    @State var password = ""
    
    @State var fullName = ""
    @State var signupEmail = ""
    @State var signupPassword = ""
    
    @State var selectionTab = 0
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                VStack {
                    Image("logo2")
                        
                    Tabs(tabs: .constant(["Login", "Sign up"]),
                         selection: $selectionTab, underlineColor: Color("Red2"), space: 50, w: 134) { title, isSelected in
                        Text(title)
                            .font(.custom("SFProText-Semibold", size: 18))
                            .foregroundColor(.black)
                    }
                    .offset(x: 50, y: 90.0)
                }
                .frame(height: 382)
                .frame(maxWidth: .infinity)
                .background(
                    CustomCorner(corners: [.bottomLeft, .bottomRight], cornerRadius: 30)
                        .fill(Color.white)
                )
                .shadow(color: Color("LightBlack"), radius: 30, x: 0.0, y: 4)

                showLoginOrSignupView
                
                Spacer()
                
                Button(action: {}, label: {
                    Text(selectionTab == 0 ? "Login" : "Sign up")
                        .frame(width: 314, height: 70, alignment: .center)
                        .foregroundColor(Color("Grey2"))
                        .background(Color("Red2"))
                        .cornerRadius(30)
                    
                })
                .padding(EdgeInsets(top: 136, leading: 0, bottom: 41, trailing: 0))
            }
        }
        .background(Color("Grey"))
        .edgesIgnoringSafeArea(.all)
    }
    
    @ViewBuilder
    var showLoginOrSignupView: some View {
        if selectionTab == 0 {
            LoginView(email: $email, password: $password)
                
        } else if selectionTab == 1 {
            SignupView(fullName: $fullName, email: $signupEmail, password: $signupPassword)
        }
    }
}

struct LoginSignUp_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignUp()
    }
}

struct LoginView: View {
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        VStack {
            TextField(
                "Email Address",
                text: $email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .font(.custom("SFProText-Semibold", size: 14))
                .foregroundColor(Color.black)
                .padding(EdgeInsets(top: 64, leading: 0, bottom: 0, trailing: 0))
                .frame(width: 314)
            
            Capsule()
                .frame(width: 314, height: 0.5, alignment: .center)
            
            SecureField(
                "Password",
                text: $password)
                .disableAutocorrection(true)
                .font(.custom("SFProText-Semibold", size: 14))
                .foregroundColor(Color.black)
                .padding(EdgeInsets(top: 46, leading: 0, bottom: 0, trailing: 0))
                .frame(width: 314)
            
            Capsule()
                .frame(width: 314, height: 0.5, alignment: .center)
            
            Text("Forgot passcode?")
                .offset(x: -83.0, y: 0)
                .padding(.top, 34)
                .foregroundColor(Color("Red2"))
                .font(.custom("SFProText-Semibold", size: 17))
        }
    }
}

struct SignupView: View {
    @Binding var fullName: String
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        VStack {
            
            TextField(
                "Full name",
                text: $fullName)
                .disableAutocorrection(true)
                .font(.custom("SFProText-Semibold", size: 14))
                .foregroundColor(Color.black)
                .padding(EdgeInsets(top: 64, leading: 0, bottom: 0, trailing: 0))
                .frame(width: 314)
            
            Capsule()
                .frame(width: 314, height: 0.5, alignment: .center)
            
            TextField(
                "Email Address",
                text: $email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .font(.custom("SFProText-Semibold", size: 14))
                .foregroundColor(Color.black)
                .padding(EdgeInsets(top: 46, leading: 0, bottom: 0, trailing: 0))
                .frame(width: 314)
            
            Capsule()
                .frame(width: 314, height: 0.5, alignment: .center)
            
            SecureField(
                "Password",
                text: $password)
                .disableAutocorrection(true)
                .font(.custom("SFProText-Semibold", size: 14))
                .foregroundColor(Color.black)
                .padding(EdgeInsets(top: 46, leading: 0, bottom: 0, trailing: 0))
                .frame(width: 314)
            
            Capsule()
                .frame(width: 314, height: 0.5, alignment: .center)
        }
    }
}
