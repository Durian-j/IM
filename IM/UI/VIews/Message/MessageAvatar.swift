//
//  MessageAvatar.swift
//  IM
//
//  Created by sfere on 2021/11/29.
//

import SwiftUI

struct MessageAvatar: View {
    @State var avatarList = Array<String>()
    
    @State var personNum: Int = 1
    
    var body: some View {
        if(personNum == 1){
            Avatar(avatar: avatarList[0])
        }
        if(personNum == 2){
            HStack(spacing: 2){
                Avatar(avatar: avatarList[0], width: 25, height: 50, isCircle: false)
                Avatar(avatar: avatarList[1], width: 25, height: 50, isCircle: false)
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
        }
        if(personNum == 3){
            HStack(spacing: 2){
                Avatar(avatar: avatarList[0], width: 25, height: 50, isCircle: false)
                VStack(spacing: 2){
                    Avatar(avatar: avatarList[1], width: 25, height: 25, isCircle: false)
                    Avatar(avatar: avatarList[2], width: 25, height: 25, isCircle: false)
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
        }
        if(personNum >= 4){
            HStack(spacing: 2){
                VStack(spacing: 2){
                    Avatar(avatar: avatarList[0], width: 25, height: 25, isCircle: false)
                    Avatar(avatar: avatarList[1], width: 25, height: 25, isCircle: false)
                }
                VStack(spacing: 2){
                    Avatar(avatar: avatarList[2], width: 25, height: 25, isCircle: false)
                    Avatar(avatar: avatarList[3], width: 25, height: 25, isCircle: false)
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
        }
    }
}

struct MessageAvatar_Previews: PreviewProvider {
    static var previews: some View {
        MessageAvatar(avatarList: ["a1","a2","a3","a4"], personNum: 4)
    }
}
