//
//  ContentView.swift
//  Facebook Auth Example
//
//  Created by Adrien Surugue on 21/05/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var facebookLoginVM = FacebookLoginViewModel()
    var body: some View {
        VStack(spacing:50){
            Spacer()
            VStack(spacing:7){
                //Text(facebookLoginVM.facebookLoginModel.name ?? "")
                //Text(facebookLoginVM.facebookLoginModel.email ?? "")
                Text(facebookLoginVM.isAuth ? "Adrien SRG": "")
                Text(facebookLoginVM.isAuth ? "Adr@gmail.com": "")
            }
            Button(action: {
                if !facebookLoginVM.isAuth{
                    facebookLoginVM.logIn()
                }else{
                    facebookLoginVM.logOut()
                }
            }, label: {
                if !facebookLoginVM.isAuthenticating{
                    Text(facebookLoginVM.isAuth ? "Log Out" : "Continuer via Facebook")
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(15)
                }else{
                    ProgressView()
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(15)
                }
            })
            Spacer()
        }
        .padding(.horizontal)
        .alert(facebookLoginVM.error, isPresented: $facebookLoginVM.showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
