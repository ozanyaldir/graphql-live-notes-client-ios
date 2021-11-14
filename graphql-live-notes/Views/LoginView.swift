//
//  LoginView.swift
//  graphql-live-notes
//
//  Created by Ozan YALDIR on 11.11.2021.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Propertiers
//    @State private var email = ""
//    @State private var password = ""
    
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    
    // MARK: - View
    var body: some View {
        VStack() {
            Text("GraphQL Client")
                .font(.largeTitle).foregroundColor(Color.white)
                .padding([.top, .bottom], 40)
                .shadow(radius: 10.0, x: 20, y: 10)
            
            Image("iosapptemplate")
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10.0, x: 20, y: 10)
                .padding(.bottom, 60)
            
            VStack(alignment: .leading, spacing: 15) {
                TextField("Email", text: $loginVM.username)
                    .padding()
                    .background(Color.themeTextField)
                    .foregroundColor(.black)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                
                SecureField("Password", text: $loginVM.password)
                    .padding()
                    .background(Color.themeTextField)
                    .foregroundColor(.black)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding([.leading, .trailing], 27.5)
            
            Button(action: {
                loginVM.login { result in
                    authentication.updateAuth(result: result)
                }
            }) {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }
            .disabled(loginVM.loginDisabled)
            .padding(.top, 50)
//            .alert(item: loginVM.$errors) { error in
//                Alert(title: Text("Invlid Login"), message: Text(error.message))
//            }
            
            Spacer()
//            HStack(spacing: 0) {
//                Text("Don't have an account? ")
//                Button(action: {}) {
//                    Text("Sign Up")
//                        .foregroundColor(.black)
//                }
//            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all))
        
    }
}

extension Color {
    static var themeTextField: Color {
        return Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    }
}
