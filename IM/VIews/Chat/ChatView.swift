//
//  ChatView.swift
//  IM
//
//  Created by sfere on 2021/11/29.
//

import SwiftUI

struct ChatView: View {
    
    var title: String
    
    var body: some View {
        
        GeometryReader { proxy in
            
            VStack (spacing: 0) {
                ChatList()
                
                SendBox(proxy: proxy)
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(title, displayMode: .inline)
            .navigationBarItems(trailing: NavigationLink(destination: Text("123"), label: { Text(IconFont.about.rawValue).foregroundColor(Color(hex: 0x98a9ff)).font(.custom("iconfont", size: 18)) }))
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(title: "tom")
    }
}
