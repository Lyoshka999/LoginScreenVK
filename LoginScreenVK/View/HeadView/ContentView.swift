//
//  ContentView.swift
//  LoginScreenVK
//
//  Created by Алексей on 22.12.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var shouldShowLogo: Bool = true
    @State private var login = ""
    @State private var password = ""
    @State private var showIncorrentCredentialsWarning = false
    @Binding var isLoginComplete: Bool
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    ).removeDuplicates()
    
    private func verifyLoginData() {
        if login == "Bar" && password == "Foo" {
            self.isLoginComplete = true
        } else {
            showIncorrentCredentialsWarning = true
        }
        password = ""
    }
    
    var registrationBlockView: some View {
        VStack {
            TextField("Login:", text: $login)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password:", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
    var loginButton: some View {
//        Button(action: verifyLoginData {
//            UIApplication.shared.endEditing()
//            print(login, " logged in")
//        })
        Button(action: verifyLoginData) {
            Text("Log in")
                .padding()
                .frame(width: 150, height: 40, alignment: .center)
        }
    }
    
    var logo: some View {
        ZStack {
            Capsule()
                .fill(.gray)
//                .shadow(color: .black, radius: 20, x: 0, y: 0)
                .frame(width: 150, height: 100, alignment: .center)
            Text("VKusno")
                .font(.custom("bip-bip", size: 40))
                .bold()
                .foregroundColor(.white)
        }
    }
    
    var body: some View {
        ZStack {
            Image("Фон")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fill)
            
            VStack {
                ScrollView {
                    VStack {
                        if shouldShowLogo {
                            logo
                        }
                        
                        Spacer(minLength: 30)
                        registrationBlockView.frame(maxWidth: 250)
                        Spacer(minLength: 30)
                        loginButton.disabled(login.isEmpty || password.isEmpty)
                    }
                }.onReceive(keyboardIsOnPublisher) { isKeyboardOn in
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        self.shouldShowLogo = !isKeyboardOn
                    }
                }
            }
            
            Spacer()
        }.onTapGesture {
            UIApplication.shared.endEditing()
        }.alert(isPresented: $showIncorrentCredentialsWarning, content: {Alert(title: Text("Error"), message: Text("Incorrent Login/Password was entered"))
        })
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isLoginComplete: .constant(false))
    }
}
