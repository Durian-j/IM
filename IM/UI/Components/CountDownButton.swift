//
//  CountDownButton.swift
//  IM
//
//  Created by sfere on 2021/11/25.
//
//  倒计时按钮组件
//

import SwiftUI
import Foundation

struct CountDownButton: View {
    
    @State private var countDown = 61
    @State private var timer: Timer?
    @Binding var vertifyCode: String
    
    var body: some View {
        Button(action: {
            vertifyCode = "56546"
            createTimer()
        }, label: {
            Text((countDown == 61) ? "获取验证码" : "请\(countDown)s之后重试")
                .font(.system(size: 15))
                .foregroundColor(Color("primary_blue"))
        })
        .disabled(countDown != 61)
        .onDisappear{
            invalidate()
        }
    }
    
    func createTimer() {
        countDown -= 1
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (t) in
                countDown -= 1
                if countDown < 0 {
                    vertifyCode = "adbdf"
                    t.invalidate()
                    timer = nil
                    countDown = 61
                }
            })
        }
    }
    
    func invalidate() {
        timer?.invalidate()
    }
}

#if DEBUG
struct CountDownButton_Previews: PreviewProvider {
    static var previews: some View {
        CountDownButton(vertifyCode: .constant("123"))
    }
}
#endif
