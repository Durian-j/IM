//
//  ContactList.swift
//  IM
//
//  Created by sfere on 2021/12/24.
//

import SwiftUI

struct ContactList: View {
    
    @State var wordNavigationtappedIndex: Int = 0
    
    var isAddressBook: Bool = true
    
    var body: some View {
        
        ZStack{
            
            ScrollView{
                
                ScrollViewReader{value in
                    
                    LazyVStack(pinnedViews: [.sectionHeaders,.sectionFooters]){
                        
                        if(isAddressBook){
                            SearchBoxVIew()
                            ContactFunctionGroup()
                        }
                        
                        Section(header: ContactSectionHeader(title: "A")){
                            ContactSection(isAddressBook: isAddressBook)
                            ContactSection(isAddressBook: isAddressBook)
                        }.id(0)
                        Section(header: ContactSectionHeader(title: "B")){
                            ContactSection(isAddressBook: isAddressBook)
                            ContactSection(isAddressBook: isAddressBook)
                            ContactSection(isAddressBook: isAddressBook)
                        }.id(1)
                        Section(header: ContactSectionHeader(title: "C")){
                            ContactSection()
                            ContactSection()
                            ContactSection()
                            ContactSection()
                        }.id(2)
                        Section(header: ContactSectionHeader(title: "D")){
                            ContactSection()
                            ContactSection()
                            ContactSection()
                            ContactSection()
                            ContactSection()
                        }.id(3)
                        Section(header: ContactSectionHeader(title: "E")){
                            ContactSection()
                            ContactSection()
                        }.id(4)
                        Section(header: ContactSectionHeader(title: "F")){
                            ContactSection()
                            ContactSection()
                        }.id(5)
                        Section(header: ContactSectionHeader(title: "G")){
                            ContactSection()
                            ContactSection()
                        }.id(6)
                        
                    }.onChange(of: wordNavigationtappedIndex, perform: { index in
                        value.scrollTo(index)
                    })
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
