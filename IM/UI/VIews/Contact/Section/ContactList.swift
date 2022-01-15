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
    @EnvironmentObject var model: ContactModel
    
    init(isAddressBook: Bool = true){
        self.isAddressBook = isAddressBook
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
