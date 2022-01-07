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
            .navigationBarItems(
                trailing: NavigationLink(
                    destination: ChatSettings(),
                    label: {
                        Text(IconFont.point.rawValue)
                            .foregroundColor(Color("text_color"))
                            .font(.custom("iconfont", size: 18))
                    })
            )
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(title: "tom")
    }
}
