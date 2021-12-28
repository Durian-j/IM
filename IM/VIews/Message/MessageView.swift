//
//  MessageView.swift
//  IM
//
//  Created by sfere on 2021/11/29.
//

import SwiftUI

struct MessageView: View {
    
    var title: String
    
    var body: some View {
        
        GeometryReader { proxy in
            
            VStack (spacing: 0) {
                MessageList()
                
                SendBox(proxy: proxy)
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(title, displayMode: .inline)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(title: "tom")
    }
}
