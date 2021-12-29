//
//  ContactModel.swift
//  IM
//
//  Created by sfere on 2021/12/29.
//

import Foundation

class ContactModel: ObservableObject {
    @Published var contactList: [Contact] = Contact.all
    @Published var contactModel: [String: Array<Contact>] = handleData()
}

func handleData() ->  [String: Array<Contact>]{
    var contactDict = [String: Array<Contact>]()
    Contact.all.forEach{ (contact) in
        if(!contactDict.keys.contains(contact.firstLetter)){
            contactDict.updateValue([contact], forKey: contact.firstLetter)
        }else{
            contactDict[contact.firstLetter]!.append(contact)
        }
    }
    return contactDict
}
