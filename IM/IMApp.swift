//
//  IMApp.swift
//  IM
//
//  Created by sfere on 2021/11/23.
//

import SwiftUI
import PartialSheet // 底部弹起菜单

@main
struct IMApp: App {
    var body: some Scene {
//      将Partial Sheet Manager实例作为环境对象添加到根视图
        WindowGroup {
            ContentView()
                .environmentObject(PartialSheetManager())
        }
    }
}
