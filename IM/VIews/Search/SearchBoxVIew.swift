//
//  SearchBoxVIew.swift
//  IM
//
//  Created by sfere on 2021/11/26.
//

import SwiftUI

struct SearchBoxVIew: View {
    
    @State var searchFullPagePresented: Bool = false
    
    var body: some View {
        
        ZStack{
                
            Rectangle().fill(Color(hex: 0xF5F5F5)).frame(height: 30).foregroundColor(.white).cornerRadius(5).padding(10)
            
            HStack{
                Image(systemName: "magnifyingglass").font(.system(size: 17))
                Text("搜索").font(.system(size: 16))
            }.foregroundColor(Color.gray)
            
        }
        .fullScreenCover(isPresented: $searchFullPagePresented, content: {
            SearchFullScreenView(searchFullPagePresented: $searchFullPagePresented)
        }).onTapGesture {
            searchFullPagePresented = true
        }
    }
}

struct SearchBoxVIew_Previews: PreviewProvider {
    static var previews: some View {
        SearchBoxVIew()
    }
}
