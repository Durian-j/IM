//
//  ContactHomeView.swift
//  IM
//
//  Created by sfere on 2021/11/30.
//

import SwiftUI

struct ContactHomeView: View {
    
    var body: some View {
        VStack{
            ContactList().environmentObject(ContactModel())
        }
    }
}

struct ContactHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContactHomeView()
    }
}
