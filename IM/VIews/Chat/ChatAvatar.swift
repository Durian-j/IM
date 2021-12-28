//
//  ChatAvatar.swift
//  IM
//
//  Created by sfere on 2021/11/29.
//

import SwiftUI

struct ChatAvatar: View {
    @State var avatarList = Array<String>()
    
    @State var personNum: Int = 1
    
    var body: some View {
        if(personNum == 1){
            Image(avatarList[0]).resizable().scaledToFill().frame(width: 50, height: 50).clipShape(Circle())
        }
        if(personNum == 2){
            HStack(spacing: 2){
                Image(avatarList[0]).resizable().scaledToFill().frame(width: 25, height: 50).clipped()
                Image(avatarList[1]).resizable().scaledToFill().frame(width: 25, height: 50).clipped()
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
        }
        if(personNum == 3){
            HStack(spacing: 2){
                Image(avatarList[0]).resizable().scaledToFill().frame(width: 25, height: 50).clipped()
                VStack(spacing: 2){
                    Image(avatarList[1]).resizable().scaledToFill().frame(width: 25, height: 25).clipped()
                    Image(avatarList[2]).resizable().scaledToFill().frame(width: 25, height: 25).clipped()
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
        }
        if(personNum == 4){
            HStack(spacing: 2){
                VStack(spacing: 2){
                    Image(avatarList[0]).resizable().scaledToFill().frame(width: 25, height: 25).clipped()
                    Image(avatarList[1]).resizable().scaledToFill().frame(width: 25, height: 25).clipped()
                }
                VStack(spacing: 2){
                    Image(avatarList[2]).resizable().scaledToFill().frame(width: 25, height: 25).clipped()
                    Image(avatarList[3]).resizable().scaledToFill().frame(width: 25, height: 25).clipped()
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
        }
    }
}

struct ChatAvatar_Previews: PreviewProvider {
    static var previews: some View {
        ChatAvatar(avatarList: ["a1","a2","a3","a4"], personNum: 4)
    }
}
