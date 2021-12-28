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
    
    
    var body: some View {
        
        VStack(spacing:0){
            
            Divider().overlay(Color.black).padding(.zero)
            
            ZStack {
                Color(hex: 0xF4F5F9)
                
                VStack {
                    
                    HStack(spacing: 12) {
                        Image("chat_send_voice")
                        
                        TextEditor(text: $sendText)
                            .frame(height: 36)
                            .cornerRadius(4)
                            
                        
                        Button(action: {
                            sendMore.toggle()
                        }, label: {
                            Image(systemName: "plus.circle")
                                .foregroundColor(Color.black)
                                .font(.system(size: 25))
                        })
                    }
                    .frame(height: 46)
                    .padding(.trailing, 10)
                    
                    if(sendMore){
                        VStack{
                            HStack {
                                
                                VStack(spacing: 5){
                                    Button(action: {
                                    }, label: {
                                        ZStack {
                                            Circle().fill(Color.white)
                                            Image(systemName: "camera.fill")
                                                .font(.system(size: 25))
                                                .foregroundColor(Color.black)
                                        }.frame(width: 54, height: 54)
                                    })
                                    Text("拍摄")
                                        .font(.system(size: 14))
                                }
                                
                                Spacer()
                                
                                VStack(spacing: 5){
                                    Button(action: {
                                    }, label: {
                                        ZStack {
                                            Circle().fill(Color.white)
                                            Image(systemName: "photo.fill")
                                                .font(.system(size: 25))
                                                .foregroundColor(Color.black)
                                        }.frame(width: 54, height: 54)
                                    })
                                    Text("照片")
                                        .font(.system(size: 14))
                                }
                                
                                Spacer()
                                
                                VStack(spacing: 5){
                                    Button(action: {
                                    }, label: {
                                        ZStack {
                                            Circle().fill(Color.white)
                                            Image(systemName: "video.fill")
                                                .font(.system(size: 25))
                                                .foregroundColor(Color.black)
                                        }.frame(width: 54, height: 54)
                                    })
                                    Text("视频")
                                        .font(.system(size: 14))
                                }
                                
                                Spacer()
                                
                                VStack(spacing: 5){
                                    Button(action: {
                                    }, label: {
                                        ZStack {
                                            Circle().fill(Color.white)
                                            Image(systemName: "folder.fill")
                                                .font(.system(size: 25))
                                                .foregroundColor(Color.black)
                                        }.frame(width: 54, height: 54)
                                    })
                                    Text("文件")
                                        .font(.system(size: 14))
                                }
                            }
                            .padding([.horizontal], 30)
                        }
                        .padding(.top, 20)
                    }
                    
                    Spacer()
                }
                .padding(.top, 5)
                Spacer()
            }
            .frame(height: proxy.safeAreaInsets.bottom + (sendMore ? 200: 46))
        }
    }
}

struct SendBox_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            SendBox(proxy: proxy)
        }
    }
}
