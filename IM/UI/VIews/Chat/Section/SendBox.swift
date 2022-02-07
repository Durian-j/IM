//
//  SendBox.swift
//  IM
//
//  Created by sfere on 2021/11/30.
//

import SwiftUI

struct SendBox: View {
    
    let proxy: GeometryProxy
    @State private var sendText: String = ""
    @State private var sendMore: Bool = false
    @State var height: CGFloat = .zero
    
    func getFocus(focused:Bool) {
        if focused {
            sendMore = false
        }
    }
    
    var body: some View {
        VStack(spacing:0){
            Divider().overlay(Color.black).padding(.zero)
            ZStack {
                Color("light_gray")
                VStack {
                    HStack(spacing: 12) {
                        ChatTextArea(text: $sendText, height: $height)
                        Button(action: {
                            sendMore.toggle()
                            hideKeyboard()
                        }, label: {
                            Image(systemName: sendMore ? "multiply.circle" : "plus.circle")
                                .foregroundColor(Color.black)
                                .font(.system(size: 25))
                        })
                    }
                    .padding(.trailing, 10)
                    if(sendMore){
                        VStack{
                            HStack {
                                SendBoxButton(title: "拍摄", icon: "camera.fill", action: {
                                })
                                Spacer()
                                SendBoxButton(title: "照片", icon: "photo.fill", action: {
                                })
                                Spacer()
                                SendBoxButton(title: "视频", icon: "video.fill", action: {
                                })
                                Spacer()
                                SendBoxButton(title: "文件", icon: "folder.fill", action: {
                                })
                            }
                            .padding([.horizontal], 30)
                        }
                        .padding(.top, 20)
                    }
                    Spacer()
                }
                .padding(.top, 10)
                Spacer()
            }
            .frame(height: proxy.safeAreaInsets.bottom + (sendMore ? 160.0 + height: height + 20.0))
        }
    }
}

// MARK: - Button

private extension SendBox{
    struct SendBoxButton: View {
        let title: String
        let icon: String
        let action: () -> Void
        
        var body: some View {
            VStack(spacing: 5){
                Button(action: action, label: {
                    ZStack {
                        Circle().fill(Color.white)
                        Image(systemName: icon)
                            .font(.system(size: 25))
                            .foregroundColor(Color.black)
                    }.frame(width: 54, height: 54)
                })
                Text(title)
                    .font(.system(size: 14))
            }
        }
    }
}

#if DEBUG
struct SendBox_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            SendBox(proxy: proxy)
        }
    }
}
#endif
