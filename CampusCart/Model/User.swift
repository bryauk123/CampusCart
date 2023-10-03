//
//  User.swift
//  CampusCart
//
//  Created by Sung Jae Ko on 10/2/23.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    
    
    func initials() -> String{
        let firstInitial = firstName.first!
        let secondInitial = lastName.first!
        
        var combinedInitial = ""
        combinedInitial.append(firstInitial)
        combinedInitial.append(secondInitial)
        return combinedInitial
    }
}

