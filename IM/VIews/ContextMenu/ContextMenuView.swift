//
//  ContextMenuView.swift
//  IM
//
//  Created by sfere on 2021/11/26.
//

import SwiftUI

struct ContextMenuView: View {
    
    @State var groupFullPagePresented: Bool = false
    
    @Binding var showContextMenu: Bool
    
    var body: some View {
        
        VStack (spacing: 0) {
            Button(action: {
                groupFullPagePresented = true
            }) {
                HStack {
                    Image(systemName: "message.fill")
                        .foregroundColor(.white)
                    Text("发起群聊")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                }
            }
            .frame(height: 40)
            .fullScreenCover(isPresented: $groupFullPagePresented, content: {
                GroupChat(groupFullPagePresented: $groupFullPagePresented,showContextMenu: $showContextMenu)
            })
            
            Rectangle()
                .fill(Color.white)
                .frame(width: 100, height: 1)
                .opacity(0.3)
            
            Button(action: {
                
            }) {
                HStack {
                    Image(systemName: "person.fill.badge.plus")
                        .foregroundColor(.white)
                    Text("添加朋友")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                }
            }.frame(height: 40)
        }
        .padding(15)
        .background(Image("context-menu"))
    }
}

struct ContextMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuView(showContextMenu: .constant(false))
    }
}
