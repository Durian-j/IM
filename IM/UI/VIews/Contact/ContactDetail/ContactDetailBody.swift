//
//  ContactDetailBody.swift
//  IM
//
//  Created by sfere on 2021/12/21.
//

import SwiftUI

struct ContactDetailBody: View {
    
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .fill(Color("dark_gray"))
                .frame(width: screenWidth, height: 250)
                .position(x: screenWidth / 2, y: 125)
            
            VStack(alignment: .center, spacing: 10){
                
                Rectangle().fill(Color.white).frame(width:1, height: 50)
                Text("姜伯约").font(.system(size: 24))
                Text("15356546464").font(.system(size: 16))
                Text("良田百顷，不在一亩；但有远志，不在当归").font(.system(size: 15)).foregroundColor(.gray)
                
                Button(action: {
                    
                }, label: {
                    
                    VStack(spacing: 5){
                        Image(systemName: "ellipsis.bubble.fill")
                            .font(.system(size: 24))
                            .foregroundColor(Color("text_color"))
                        Text("聊天")
                            .font(.system(size: 14))
                            .foregroundColor(Color("text_color"))
                    }
                }).padding(.top, 10)
                
                Spacer()
            }
            .frame(width: screenWidth - 50, height: 240, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.white)
            .cornerRadius(10)
            .position(x: screenWidth / 2, y: 280)
            
            Image("avatar1").resizable().scaledToFill().frame(width: 100, height: 100).clipShape(Circle()).position(x: screenWidth / 2, y: 150)
            
            VStack(alignment: .leading, spacing: 0){
                
                GeneralRow(title: "备注和标签")
                GeneralRow(title: "分享名片")
                GeneralRow(title: "加入黑名单", showDivider: false)
            }
            .background(Color.white)
            .position(x: screenWidth / 2, y: 495)
            
            Button(action: {}, label: {
                Text("删除")
                    .font(.system(size: 16))
                    .foregroundColor(Color("red_color"))
            })
                .frame(width: screenWidth - 30, height: 40)
                .background(Color.white)
                .position(x: screenWidth / 2, y: 600)
            
        }
        .frame(width: screenWidth, height: screenHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color("light_gray"))
        
    }
}

struct ContactDetailBody_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailBody().ignoresSafeArea()
    }
}
