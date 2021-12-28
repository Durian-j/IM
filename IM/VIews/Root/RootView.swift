//
//  RootView.swift
//  IM
//
//  Created by sfere on 2021/11/25.
//

import SwiftUI

struct RootView: View {
    
    let screenWidth = UIScreen.main.bounds.width
    
    @State var showContextMenu: Bool = false
    
    @State var modifyInfoFlag: Bool = false

    var body: some View {
        
        ZStack{
            
            BodyAreaView(showContextMenu: $showContextMenu)
            
            // 聊天页面增加菜单栏
            if showContextMenu {
                GeometryReader { geometry in
                    ContextMenuView(showContextMenu: $showContextMenu).position(x: screenWidth - 75, y: 100)
                }.background(
                    Color.black.opacity(0.5).edgesIgnoringSafeArea(.all).onTapGesture {
                        withAnimation {
                            showContextMenu.toggle()
                        }
                    }
                )
            }
            
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
