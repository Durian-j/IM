//
//  Chat.swift
//  IM
//
//  Created by sfere on 2021/11/26.
//

import Foundation

struct Chat: Codable, Equatable, Identifiable {
    var id: Int
    var name: String
    var avatarList: Array<String>
    var avatarNum: Int
    var messageDes: String
    var time: String
    var messageCount: String
}

extension Chat {
    static let all:[Chat] = [
        chat1, chat2, chat3, chat4, chat5, chat6, chat7, chat8
    ]
    
    static let chat1 = Chat(
        id: 1, name: "刘禹锡", avatarList: ["avatar1"], avatarNum: 1, messageDes: "王濬楼船下益州，金陵王气黯然收。", time: "11:35", messageCount: "5"
    )
    
    static let chat2 = Chat(
        id: 2, name: "刘禹锡", avatarList: ["a1"], avatarNum: 1, messageDes: "千寻铁锁沉江底，一片降幡出石头。", time: "11:35", messageCount: "5"
    )
    
    static let chat3 = Chat(
        id: 3, name: "刘禹锡", avatarList: ["a2"], avatarNum: 1, messageDes: "人世几回伤往事，山形依旧枕寒流。", time: "11:35", messageCount: "5"
    )
    
    static let chat4 = Chat(
        id: 4, name: "刘禹锡", avatarList: ["a3"], avatarNum: 1, messageDes: "今逢四海为家日，故垒萧萧芦荻秋。", time: "11:35", messageCount: "5"
    )
    
    static let chat5 = Chat(
        id: 5, name: "李白", avatarList: ["a4"], avatarNum: 1, messageDes: "五月天山雪，无花只有寒。", time: "11:35", messageCount: "5"
    )
    
    static let chat6 = Chat(
        id: 6, name: "李白", avatarList: ["a1","a2"], avatarNum: 2, messageDes: "笛中闻折柳，春色未曾看。", time: "11:35", messageCount: "5"
    )
    
    static let chat7 = Chat(
        id: 7, name: "李白", avatarList: ["a1","a2","a3"], avatarNum: 3, messageDes: "晓战随金鼓，宵眠抱玉鞍。", time: "11:35", messageCount: "5"
    )
    
    static let chat8 = Chat(
        id: 8, name: "李白", avatarList: ["a1","a2","a3","a4"], avatarNum: 4, messageDes: "愿将腰下剑，直为斩楼兰。", time: "11:35", messageCount: "5"
    )
}
