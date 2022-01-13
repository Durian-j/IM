//
//  File.swift
//  IM
//
//  Created by sfere on 2021/11/29.
//

import Foundation

struct Chat: Codable, Equatable, Identifiable {
    
    var id: Int
    var name: String
    var avatar: String
    var text: String
    var type: MessageType
    
    enum MessageType: String, Codable, Equatable {
        case text
        case image
        case voice
        case video
    }
}
