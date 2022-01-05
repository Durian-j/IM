//
//  BodyAreaView.swift
//  IM
//
//  Created by sfere on 2021/12/3.
//

import SwiftUI

struct BodyAreaView: View {
    
    @State private var selection: Int = 0
    
    @ObservedObject var state:RootState = RootState()
    
    @Binding var showContextMenu: Bool
    
    @Binding var addFriendsFlag: Bool
    
    var body: some View {
        
        NavigationView{
            
            TabView(selection: $selection){
                
                MessageListView()
                    .tabItem {
                        Item(type: .chat, selection: selection)
                    }
                    .tag(0)
                
                ContactHomeView()
                    .tabItem {
                        Item(type: .contact, selection: selection)
                    }
                    .tag(1)
                
                MeHome()
                    .tabItem {
                        Item(type: .setting, selection: selection)
                    }
                    .tag(2)
                    .ignoresSafeArea()
                    .navigationBarHidden(true)
                
            }
            .onAppear {
//                修复ios15滚动状态下状态栏和菜单栏透明问题
                if #available(iOS 15.0, *) {
                    let appearance = UITabBarAppearance()
                    UITabBar.appearance().scrollEdgeAppearance = appearance
                    
                    let navAppearance = UINavigationBarAppearance()
                    UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
                }
            }
            .navigationBarHidden(itemType.isNavigationBarHidden(selection: selection))
            .navigationBarTitle(itemType.title, displayMode: .inline)
            .navigationBarItems(trailing: navigationBarTrailingItems(selection: selection))
        }
    }
    
    func navigationBarTrailingItems(selection: Int) -> AnyView {
        switch ItemType(rawValue: selection)! {
        case .chat:
            return AnyView(Button(action: {
                showContextMenu.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .renderingMode(.template)
                            .foregroundColor(Color(.label))
                            .font(.system(size: 16))
                    }))
        case .contact:
            return AnyView(Button(action: {
                addFriendsFlag = true
                    }, label: {
                        Image(systemName: "person.badge.plus")
                            .renderingMode(.template)
                            .foregroundColor(Color(.label))
                            .font(.system(size: 16))
                    }))
        case .setting:
            return AnyView(EmptyView())
        }
    }
    
    enum ItemType: Int {
        case chat
        case contact
        case setting
        
        var image: Image {
            switch self {
            case .chat:
                return Image(systemName: "ellipsis.bubble")
            case .contact:
                return Image(systemName: "person.2")
            case .setting:
                return Image(systemName: "gearshape")
            }
        }
        
        var title: String {
            switch self {
            case .chat:
                return "消息"
            case .contact:
                return "通讯录"
            case .setting:
                return "设置"
            }
        }
        
        func isNavigationBarHidden(selection: Int) -> Bool {
            selection == ItemType.setting.rawValue
        }
    }
    
    struct Item: View {
        let type: ItemType
        let selection: Int
        
        var body: some View {
            VStack{
                type.image
                Text(type.title)
            }
        }
    }
    
    private var itemType: ItemType{
        ItemType(rawValue: selection)!
    }
}

struct BodyAreaView_Previews: PreviewProvider {
    static var previews: some View {
        BodyAreaView(showContextMenu: .constant(false), addFriendsFlag: .constant(false))
    }
}
