//
//  ContactDetailBody.swift
//  IM
//
//  Created by sfere on 2021/12/21.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.width

struct ContactDetailBody: View {
    
    let screenHeight = UIScreen.main.bounds.height
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .fill(Color.gray)
                .frame(width: screenWidth, height: 250)
                .position(x: screenWidth / 2, y: 125)
            
            VStack(alignment: .center, spacing: 10){
                
                Rectangle().fill(Color.white).frame(width:1, height: 50)
                Text("陈晓宇").font(.system(size: 24))
                Text("15356546464").font(.system(size: 16))
                Text("走别人的路，让他们无路可走").font(.system(size: 16)).foregroundColor(.gray)
                
                Button(action: {
                    
                }, label: {
                    
                    VStack(spacing: 5){
                        Image(systemName: "ellipsis.bubble.fill")
                            .font(.system(size: 24))
                            .foregroundColor(Color(hex: 0x333333))
                        Text("聊天")
                            .font(.system(size: 14))
                            .foregroundColor(Color(hex: 0x333333))
                    }
                }).padding(.top, 10)
                
                Spacer()
            }
            .frame(width: screenWidth - 50, height: 240, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.white)
            .cornerRadius(10)
            .position(x: screenWidth / 2, y: 280)
            
            Image("a1").resizable().scaledToFill().frame(width: 100, height: 100).clipShape(Circle()).position(x: screenWidth / 2, y: 150)
            
            VStack(alignment: .leading, spacing: 0){
                
                GeneralRow(title: "备注和标签")
                GeneralRow(title: "分享名片")
                GeneralRow(title: "加入黑名单")
                GeneralRow(title: "删除", showDivider: false, color: Color.red)
            }
            .background(Color.white)
            .position(x: screenWidth / 2, y: 495)
            
            
            
        }
        .frame(width: screenWidth, height: screenHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color(hex: 0xF4F5F9))
        
    }
}

struct ContactDetailBody_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailBody().ignoresSafeArea()
    }
}
