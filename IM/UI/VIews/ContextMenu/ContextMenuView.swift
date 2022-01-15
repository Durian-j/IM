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
    @Binding var addFriendsFlag: Bool
    
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
            .fullScreenCover(isPresented: $groupFullPagePresented, onDismiss: {
                showContextMenu = false
            }, content: {
                GroupChatView(groupFullPagePresented: $groupFullPagePresented)
                    .ignoresSafeArea(.container, edges: .bottom)
            })
            
            Rectangle()
                .fill(Color.white)
                .frame(width: 100, height: 1)
                .opacity(0.3)
            Button(action: {
                addFriendsFlag = true
                showContextMenu = false
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

#if DEBUG
struct ContextMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuView(showContextMenu: .constant(false), addFriendsFlag: .constant(false))
    }
}
#endif
