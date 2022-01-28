//
//  FriendApplicationView.swift
//  IM
//
//  Created by admin on 2022/1/16.
//

import SwiftUI

struct FriendApplicationView: View {
    var body: some View {
        VStack(spacing: 0){
            Rectangle().fill(Color("light_gray")).frame(height: 10)
            NavigationLink(destination: ContactDetailView(), label: {
                HStack(spacing: 0){
                    Avatar(avatar: "avatar1", width: 45, height: 45)
                    Text("Jack").foregroundColor(Color("text_color")).padding(.leading, 10)
                    Text("(14534342432)").font(.system(size: 15)).foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all, 10)
                .background(Color.white)
            })
            Divider()
            HStack{
                Text("留言").font(.system(size: 16)).foregroundColor(Color("text_color"))
                Spacer()
                Text("你好我是jack").font(.system(size: 15)).foregroundColor(.gray)
            }.padding()
            Divider()
            
            HStack(spacing: 40){
                Button(action: {}, label: {
                    Text("同意")
                        .font(.system(size: 16))
                        .padding(EdgeInsets(.init(top: 10, leading: 50, bottom: 10, trailing: 50)))
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(4)
                })
                Button(action: {}, label: {
                    Text("拒绝")
                        .font(.system(size: 16))
                        .padding(EdgeInsets(.init(top: 10, leading: 50, bottom: 10, trailing: 50)))
                        .background(Color("medium_gray"))
                        .foregroundColor(Color("text_color"))
                        .cornerRadius(4)
                })
            }.padding()
            Spacer()
        }
        .navigationBarTitle("好友申请", displayMode: .inline)
    }
}

struct FriendApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        FriendApplicationView()
    }
}
