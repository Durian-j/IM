//
//  ContactSectionHeader.swift
//  IM
//
//  Created by sfere on 2021/11/30.
//

import SwiftUI

struct ContactSectionHeader: View {
    var title: String
    
    var body: some View {
        HStack{
            Text(title).font(.system(size: 16)).foregroundColor(Color("text_color"))
            Spacer()
        }
        .padding(5)
        .padding(.leading, 10)
        .background(Color(red: 237/255, green: 237/255, blue: 237/255))
    }
}

#if DEBUG
struct ContactSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        ContactSectionHeader(title: "A")
    }
}
#endif
