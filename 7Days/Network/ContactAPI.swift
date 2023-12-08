//
//  contactAPI.swift
//  7Days
//
//  Created by Sudhir Pawar on 11/09/23.
//

import Foundation
class ContactAPI{
    static func getContacts() -> [Contact] {
        let contacts = [
        
            Contact(name: "Sudhir Pawar", jobTitle: "iOS Dev", country: "India"),
            Contact(name: "Chintu", jobTitle: "AND Dev", country: "India"),
            Contact(name: "Uday Kotla", jobTitle: "iOS Dev", country: "India"),
            Contact(name: "Saikumar", jobTitle: "AND Dev", country: "India"),
            Contact(name: "Suraj Gupta", jobTitle: "iOS Dev", country: "India"),
        ]
        
        return contacts
    }
}
