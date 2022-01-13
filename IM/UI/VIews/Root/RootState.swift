//
//  RootState.swift
//  IM
//
//  Created by sfere on 2021/11/26.
//

import SwiftUI
import Combine

//遵循 ObservableObject 协议的类可以使用 SwiftUI 的 @Published 属性包装器来自动发布属性的变化，以便使用该类的实例的任何视图能够自动重新调用 body 属性，保持界面与数据的一致

final class RootState: ObservableObject {
    
// 由于LocalizedStringKey结构符合ExpressibleByStringInterpolation协议，后者又继承自ExpressibleByStringLiteral协议。这允许您在文本视图中使用字符串文本
    
    @Published var navigationBarTitle: String = ""
    
    @Published var navigationBarTrailingItems: AnyView = AnyView(EmptyView())
    
    @Published var showContextMenu: Bool = false
}
