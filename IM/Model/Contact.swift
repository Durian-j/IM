//
//  Contact.swift
//  IM
//
//  Created by sfere on 2021/12/28.
//

import Foundation

struct Contact: Codable, Equatable, Identifiable {
    var id: Int
    var name: String
    var avatar: String
    var account: String
    var firstLetter: String
}

extension Contact {
    static let all:[Contact] = [
        contact1,contact2,contact3,contact4,contact5,contact6
    ]
    
    static let contact1 = Contact(
        id: 1, name: "陈", avatar: "avatar1", account: "15365648987", firstLetter: "C"
    )
    
    static let contact2 = Contact(
        id: 2, name: "曹", avatar: "avatar1", account: "15365648987", firstLetter: "C"
    )
    
    static let contact3 = Contact(
        id: 3, name: "冯", avatar: "avatar1", account: "15365648987", firstLetter: "F"
    )
    
    static let contact4 = Contact(
        id: 4, name: "郭", avatar: "avatar1", account: "15365648987", firstLetter: "G"
    )
    
    static let contact5 = Contact(
        id: 5, name: "胡", avatar: "avatar1", account: "15365648987", firstLetter: "H"
    )
    
    static let contact6 = Contact(
        id: 6, name: "黄", avatar: "avatar1", account: "15365648987", firstLetter: "H"
    )
}
