//
//  Auth.swift
//  Tsahil
//
//  Created by fares elsokary on 10/28/18.
//  Copyright © 2018 elryad. All rights reserved.
//

import Foundation


class AuthService{
    static let  instance = AuthService()
    let defaults = UserDefaults.standard
    
    
    var LoggedIn : Bool {
        get{
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set{
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    
    var Auth_Token : String{
        get{
            return defaults.value(forKey: Tokken_KEY) as! String
        }set{
            defaults.set(newValue, forKey: Tokken_KEY)
        }
    }
    
    var User_Email : String{
        get{
            return defaults.value(forKey: USER_EMAIL) as! String
        }set{
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    
    func RegisterUser(email : String, password : String, completion : @escaping CompletionHandler){
        
       var LowerCaseEmail = email.lowercased()
        
        
    }
    
    func Login(email : String, password : String, completion : @escaping CompletionHandler){
        
    }
    
}
