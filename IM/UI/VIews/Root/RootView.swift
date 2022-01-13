//
//  RootView.swift
//  IM
//
//  Created by sfere on 2021/11/25.
//

import SwiftUI

struct RootView: View {
    
    @State var showContextMenu: Bool = false
    
    @State var modifyInfoFlag: Bool = false
    
    @State var addFriendsFlag: Bool = false

    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                BodyAreaView(showContextMenu: $showContextMenu, addFriendsFlag: $addFriendsFlag)
                
                // 聊天页面增加菜单栏
                if showContextMenu {
                    GeometryReader { geometry in
                        ContextMenuView(showContextMenu: $showContextMenu, addFriendsFlag: $addFriendsFlag)
                            .position(x: screenWidth - 75, y: 100)
                    }.background(
                        Color.black.opacity(0.5).edgesIgnoringSafeArea(.all).onTapGesture {
                            withAnimation {
                                showContextMenu.toggle()
                            }
                        }
                    )
                }
                    
                NavigationLink(destination: AddFriendsPage(),isActive: $addFriendsFlag, label: {
                })
                    .navigationBarHidden(true)
                    .navigationBarTitle("", displayMode: .inline)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
