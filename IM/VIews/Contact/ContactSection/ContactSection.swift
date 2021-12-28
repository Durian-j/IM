//
//  ContactSection.swift
//  IM
//
//  Created by sfere on 2021/11/30.
//

import SwiftUI

struct ContactSection: View {
    
    @State var isSelect: Bool = false
    
    var isAddressBook: Bool = true
    
    var body: some View {
        if(isAddressBook){
            NavigationLink(
                destination: ContactDetailView(),
                label: {
                    VStack{
                        HStack{
                            ContactSectionInfo()
                            Spacer()
                        }
                        .padding(.leading, 20)
                        Divider()
                    }
                })
        }else{
            VStack{
                Button(action: {
                    isSelect.toggle()
                }) {
                    HStack{
                        if(isSelect){
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
                        ContactSectionInfo()
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
    var body: some View {
        Image("a2").resizable().scaledToFill().frame(width: 45, height: 45).clipShape(Circle())
        VStack(alignment: .leading, spacing: 3){
            Text("柴").foregroundColor(Color(hex: 0x333333))
            Text("15365365365").font(.system(size: 14)).foregroundColor(.gray)
        }
    }
}

struct ContactSection_Previews: PreviewProvider {
    static var previews: some View {
        ContactSection()
    }
}
