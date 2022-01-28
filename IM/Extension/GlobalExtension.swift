//
//  Extension.swift
//  IM
//
//  Created by admin on 2022/1/28.
//

import SwiftUI

// 收起键盘
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}


// 禁用返回按钮之后保持手势返回依然生效
extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}

