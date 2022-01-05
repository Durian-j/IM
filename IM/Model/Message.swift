//
//  Message.swift
//  IM
//
//  Created by sfere on 2021/11/26.
//

import Foundation

struct Message: Codable, Equatable, Identifiable {
    var id: Int
    var name: String
    var avatarList: Array<String>
    var avatarNum: Int
    var messageDes: String
    var time: String
    var messageCount: String
}

extension Message {
    static let all:[Message] = [
        chat1, chat2, chat3, chat4, chat5, chat6, chat7, chat8
    ]
    
    static let chat1 = Message(
        id: 1, name: "琅琊王氏", avatarList: ["avatar1"], avatarNum: 1, messageDes: "王濬楼船下益州，金陵王气黯然收。", time: "11:35", messageCount: "5"
    )
    
    static let chat2 = Message(
        id: 2, name: "陈郡谢氏", avatarList: ["a1"], avatarNum: 1, messageDes: "千寻铁锁沉江底，一片降幡出石头。", time: "11:35", messageCount: "5"
    )
    
    static let chat3 = Message(
        id: 3, name: "陈郡袁氏", avatarList: ["a2"], avatarNum: 1, messageDes: "人世几回伤往事，山形依旧枕寒流。", time: "11:35", messageCount: "5"
    )
    
    static let chat4 = Message(
        id: 4, name: "兰陵萧氏", avatarList: ["a3"], avatarNum: 1, messageDes: "今逢四海为家日，故垒萧萧芦荻秋。", time: "11:35", messageCount: "5"
    )
    
    static let chat5 = Message(
        id: 5, name: "清河崔氏", avatarList: ["a4"], avatarNum: 1, messageDes: "五月天山雪，无花只有寒。", time: "11:35", messageCount: "5"
    )
    
    static let chat6 = Message(
        id: 6, name: "范阳卢氏", avatarList: ["a1","a2"], avatarNum: 2, messageDes: "笛中闻折柳，春色未曾看。", time: "11:35", messageCount: "5"
    )
    
    static let chat7 = Message(
        id: 7, name: "陇西李氏", avatarList: ["a1","a2","a3"], avatarNum: 3, messageDes: "晓战随金鼓，宵眠抱玉鞍。", time: "11:35", messageCount: "5"
    )
    
    static let chat8 = Message(
        id: 8, name: "荥阳郑氏", avatarList: ["a1","a2","a3","a4"], avatarNum: 4, messageDes: "愿将腰下剑，直为斩楼兰。", time: "11:35", messageCount: "5"
    )
}
