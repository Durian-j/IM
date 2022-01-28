//
//  ContentView.swift
//  IM
//
//  Created by sfere on 2021/11/23.
//

import SwiftUI
import PartialSheet

let screenWidth = UIScreen.main.bounds.width

let screenHeight = UIScreen.main.bounds.height

let safeAreaInsets = UIApplication.shared.windows.first?.safeAreaInsets

struct ContentView: View {
    
    init(){
        UINavigationBar.appearance().tintColor = .black
    }

    @State var isAuth: Bool = false

    var body: some View {
//        if(isAuth){
//            RootView()
//        }else{
//            LoginView(isAuth: $isAuth).ignoresSafeArea(edges: .top)
//        }
        
//      将Partial View添加到Root View
        RootView()
            .addPartialSheet()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
