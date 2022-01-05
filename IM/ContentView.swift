//
//  ContentView.swift
//  IM
//
//  Created by sfere on 2021/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isAuth: Bool = false
    
    var body: some View {
//        if(isAuth){
//            RootView()
//        }else{
//            LoginPage(isAuth: $isAuth).ignoresSafeArea(edges: .top)
//        }
        RootView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
