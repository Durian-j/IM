//
//  ContactList.swift
//  IM
//
//  Created by sfere on 2021/12/24.
//

import SwiftUI

struct ContactList: View {
    
    @State var wordNavigationtappedIndex: Int = 0
    
    var isAddressBook: Bool
    
//    @State private var contacts: [Contact] = Contact.all
    
    @EnvironmentObject var model: ContactModel
    
//    var contactDict = [String: Array<Contact>]()
    
    init(isAddressBook: Bool = true){
        self.isAddressBook = isAddressBook
//        contacts.forEach{ (contact) in
//            if(!contactDict.keys.contains(contact.firstLetter)){
//                contactDict.updateValue([contact], forKey: contact.firstLetter)
//            }else{
//                contactDict[contact.firstLetter]!.append(contact)
//            }
//        }
    }
    
    var body: some View {
        ZStack{
            ScrollView{
                ScrollViewReader{value in
                    LazyVStack(pinnedViews: [.sectionHeaders,.sectionFooters]){
                        if(isAddressBook){
                            SearchBoxVIew()
                            ContactFunctionGroup()
                        }
                        ForEach(model.contactModel.keys.sorted(), id: \.self) {key in
                            Section(header: ContactSectionHeader(title: key)){
                                ForEach(model.contactModel[key]!){ item in
                                    ContactSection(isAddressBook: isAddressBook, contact: item)
                                }
                            }
                        }
                    }
                }
            }
//            WordNavigation(wordNavigationtappedIndex: $wordNavigationtappedIndex)
        }
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        ContactList()
    }
}
