//
//  Contact.swift
//  IM
//
//  Created by sfere on 2021/12/28.
//

import Foundation
import SwiftUI

struct Contact: Codable, Equatable, Identifiable {
    var id: Int
    var name: String
    var avatar: String
    var account: String
    var firstLetter: String
    var select: Bool = false
}

extension Contact {
    static let all:[Contact] = [
        contact1,contact2,contact3,contact4,contact5,contact6,contact7,contact8,contact9,contact10
    ]
    
    static let contact1 = Contact(
        id: 1, name: "陈", avatar: "avatar1", account: "15365648987", firstLetter: "C", select: false
    )
    
    static let contact2 = Contact(
        id: 2, name: "曹", avatar: "a1", account: "15365648987", firstLetter: "C", select: false
    )
    
    static let contact3 = Contact(
        id: 3, name: "冯", avatar: "a2", account: "15365648987", firstLetter: "F", select: false
    )
    
    static let contact4 = Contact(
        id: 4, name: "郭", avatar: "a3", account: "15365648987", firstLetter: "G", select: false
    )
    
    static let contact5 = Contact(
        id: 5, name: "胡", avatar: "a4", account: "15365648987", firstLetter: "H", select: false
    )
    
    static let contact6 = Contact(
        id: 6, name: "黄", avatar: "avatar1", account: "15365648987", firstLetter: "H", select: false
    )
    
    static let contact7 = Contact(
        id: 7, name: "李", avatar: "a1", account: "15365648987", firstLetter: "L", select: false
    )
    
    static let contact8 = Contact(
        id: 8, name: "刘", avatar: "a2", account: "15365648987", firstLetter: "L", select: false
    )
    
    static let contact9 = Contact(
        id: 9, name: "王", avatar: "a3", account: "15365648987", firstLetter: "W", select: false
    )
    
    static let contact10 = Contact(
        id: 10, name: "谢", avatar: "a4", account: "15365648987", firstLetter: "X", select: false
    )
}
