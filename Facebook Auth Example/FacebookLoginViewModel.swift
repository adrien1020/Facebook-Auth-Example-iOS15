//
//  FacebookLoginViewModel.swift
//  Facebook Auth Example
//
//  Created by Adrien Surugue on 18/05/2022.
//

import Foundation
import FacebookLogin
import FirebaseAuth
import FacebookCore

class FacebookLoginViewModel: ObservableObject{
    
    let facebookLoginManager = LoginManager()
    
    @Published var facebookLoginModel = FacebookLoginModel()
    @Published var isAuthenticating = false
    @Published var isAuth = false
    @Published var error = ""
    @Published var showAlert = false
    
    func logIn(){
        self.isAuth = false
        self.showAlert = false
        self.isAuthenticating = true
        facebookLoginManager.logIn(permissions: [.publicProfile, .email], viewController: nil){ loginResult in
            switch loginResult {
            case .failed(let error):
                self.isAuthenticating = false
                self.error = error.localizedDescription
                self.showAlert = true
            case .cancelled:
                self.isAuthenticating = false
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("DEBUG: Logged in! \(grantedPermissions) \(declinedPermissions) \(String(describing: accessToken))")
                
                GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, email"]).start(completion: { (connection, result, error) in
                    if error == nil{
                        let fbProfileDetails = result as! NSDictionary
                        print("DEBUG: FB details \(fbProfileDetails)")
                        
                        //self.isAuthenticating = false
                        //self.isAuth = true
                        //self.facebookLoginModel.email = fbProfileDetails.value(forKey: "email") as? String
                        //self.facebookLoginModel.id = fbProfileDetails.value(forKey: "id") as! String
                        //self.facebookLoginModel.name = fbProfileDetails.value(forKey: "name") as? String
                        let facebookName = fbProfileDetails.value(forKey: "name") as? String
                        
                        if let token = AccessToken.current, !token.isExpired {
                            print("DEBUG: Token=\(token.tokenString)")
                            self.firebaseAuth(tokenString: token.tokenString, facebookName: facebookName!)
                        }
                    }
                })
            }
        }
    }
    func firebaseAuth(tokenString: String, facebookName: String){
        let credential = FacebookAuthProvider.credential(withAccessToken: tokenString)
     
        Auth.auth().signIn(with: credential){ result, error in
            if let error = error {
                self.error = error.localizedDescription
                self.showAlert = true
                self.isAuthenticating = false
                self.isAuth = false
                return
            }
            if result != nil{
                self.facebookLoginModel.email = result?.user.email
                self.facebookLoginModel.name = facebookName
                self.isAuthenticating = false
                self.isAuth = true
                print("DEBUG: Auth with Firebase success")
            }
        }
    }
    
    func logOut(){
        self.facebookLoginModel.email = ""
        self.facebookLoginModel.id = ""
        self.facebookLoginModel.name = ""
        self.isAuth = false
    }
}



