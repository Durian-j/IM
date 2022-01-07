//
//  ContactSection.swift
//  IM
//
//  Created by sfere on 2021/11/30.
//

import SwiftUI

struct ContactSection: View {
    
    var isAddressBook: Bool = true
    
    var contact: Contact
    
    @State var isSelect: Bool = false
    
    @EnvironmentObject var model: ContactModel
    
    var index: Int {
        model.contactList.firstIndex(where: { $0.id == contact.id })!
    }
    
    var body: some View {
        if(isAddressBook){
            NavigationLink(
                destination: ContactDetailView(),
                label: {
                    VStack{
                        HStack{
                            ContactSectionInfo(contact: contact)
                            Spacer()
                        }
                        .padding(.leading, 20)
                        Divider()
                    }
                })
        }else{
            VStack{
                Button(action: {
                    model.contactList[index].select.toggle()
                    if( model.contactList[index].select){
                        model.selectedList.append(model.contactList[index])
                    }else{
                        model.selectedList.removeAll(where: { $0.id == model.contactList[index].id})
                    }
                }) {
                    HStack{
                        if(model.contactList[index].select){
                            Text(IconFont.selected.rawValue)
                                .font(.custom("iconfont", size: 20))
                                .padding(.trailing, 3)
                        }else{
                            Circle()
                                .fill(.clear)
                                .frame(width: 18, height: 18)
                                .overlay(Circle().stroke(Color.gray))
                                .padding(.trailing, 5)
                        }
                        ContactSectionInfo(contact: contact)
                        Spacer()
                    }
                }
                .padding(.leading, 20)
                Divider()
            }
        }
    }
}

struct ContactSectionInfo: View {
    var contact: Contact
    var body: some View {
        Image(contact.avatar).resizable().scaledToFill().frame(width: 45, height: 45).clipShape(Circle())
        VStack(alignment: .leading, spacing: 3){
            Text(contact.name).foregroundColor(Color("text_color"))
            Text(contact.account).font(.system(size: 14)).foregroundColor(.gray)
        }
    }
}

struct ContactSection_Previews: PreviewProvider {
    static var previews: some View {
        ContactSection(contact: Contact(id: 1, name: "李白", avatar: "a1", account: "123", firstLetter: "L", select: false))
    }
}
