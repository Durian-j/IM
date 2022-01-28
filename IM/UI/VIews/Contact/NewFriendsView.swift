//
//  NewFriendsView.swift
//  IM
//
//  Created by sfere on 2022/1/10.
//

import SwiftUI

struct NewFriendsView: View {
    var body: some View {
        ScrollView{
            ScrollViewReader{value in
                LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders, .sectionFooters]){
                    Section(header: ContactSectionHeader(title: "最近三天"), content: {
                        FriendRequestRow(avatar: "avatar1", name: "Tom", desc: "你好，我是Tom", isAdd: false)
                        FriendRequestRow(avatar: "a1", name: "Tom", desc: "你好，我是Tom", isAdd: true)
                        FriendRequestRow(avatar: "a2", name: "Tom", desc: "你好，我是Tom", isAdd: false)
                    })
                    Section(header: ContactSectionHeader(title: "三天前"), content: {
                        FriendRequestRow(avatar: "avatar1", name: "Tom", desc: "你好，我是Tom", isAdd: false)
                        FriendRequestRow(avatar: "a1", name: "Tom", desc: "你好，我是Tom", isAdd: true)
                        FriendRequestRow(avatar: "a2", name: "Tom", desc: "你好，我是Tom", isAdd: false)
                    })
                }
            }
        }
//        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("新的朋友", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {}, label: {
            Text("清空").font(.system(size: 16)).foregroundColor(Color.black)
        }))
    }
}

// MARK: - FriendRequestRow

private extension NewFriendsView{
    struct FriendRequestRow: View {
        let avatar: String
        let name: String
        let desc: String
        let isAdd: Bool
        
        var body: some View {
            NavigationLink(destination: FriendApplicationView(), label: {
                VStack(spacing: 0){
                    HStack(spacing: 8){
                        Avatar(avatar: avatar, width: 45, height: 45)
                        VStack(alignment: .leading, spacing: 3){
                            Text(name).font(.system(size: 16)).foregroundColor(Color("text_color"))
                            Text(desc).font(.system(size: 14)).foregroundColor(.gray)
                        }
                        Spacer()
                        if(isAdd){
                            Text("已添加").font(.system(size: 15)).foregroundColor(.gray)
                        }else{
                            Button(action: {}, label: {
                                Text("同意")
                                    .font(.system(size: 14))
                                    .padding(EdgeInsets(.init(top: 3, leading: 7, bottom: 3, trailing: 7)))
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(4)
                            })
                        }
                    }.padding(.all, 10)
                    Divider()
                }
            })
        }
    }

}

#if DEBUG
struct NewFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        NewFriendsView()
    }
}
#endif
