//
//  SearchFullScreenView.swift
//  IM
//
//  Created by sfere on 2021/11/26.
//

import SwiftUI

struct SearchFullScreenView: View {
    
    @State var searchText: String = ""
    @Binding var searchFullPagePresented: Bool
    
    var body: some View {
        ScrollView{
            HStack{
                ZStack{
                    Rectangle().fill().frame(height: 30).foregroundColor(Color("medium_gray")).cornerRadius(5).padding(12.5)
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 16))
                            .padding(.leading, 5)
                        TextField("搜索", text: $searchText)
                            .font(.system(size: 16))
                    }
                    .foregroundColor(Color.gray)
                    .padding()
                }
                Button(action: {
                    searchFullPagePresented = false
                }, label: {
                    Text("取消")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }).padding(.trailing)
            }
            Text("搜索联系人或者群名称")
                .font(.system(size: 16))
                .foregroundColor(.gray)
        }
    }
}

#if DEBUG
struct SearchFullScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFullScreenView(searchFullPagePresented: .constant(true))
    }
}
#endif
