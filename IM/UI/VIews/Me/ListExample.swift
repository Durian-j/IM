//
//  AnimationContentExample.swift
//  PartialSheetExample
//
//  Created by Eliott Robson on 21/09/2020.
//  Copyright © 2020 Swift. All rights reserved.
//

import SwiftUI
import PartialSheet
import UIKit
import SPPermissions
import AVFoundation

//struct ListExample: View {
//
//    let permissions: [SPPermissions.Permission] = [.camera,]
//
//    @State private var showImagePicker = false
//        //这里的image用于放置等会获取的照片
//        @State private var image: UIImage = UIImage()
//        var body: some View {
//            List{
//                Button(action: {
////                    showImagePicker = true
//                    let controller = SPPermissions.native(permissions)
//                }, label: {
//                    Text("Select Image")
//                })
//
//                Image(uiImage: image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//            }
//            .fullScreenCover(isPresented: $showImagePicker, content: {
//                ImagePicker(sourceType: .savedPhotosAlbum) { image in
//                    self.image = image
//                }.ignoresSafeArea()
//            })
////            .sheet(isPresented: $showImagePicker) {
////                        SPPermissionsList(permissions: [.camera])
////                    }
//        }
//}

//class CameraManager : ObservableObject {
//    @Published var permissionGranted = false
//    
//    func requestPermission() {
//        AVCaptureDevice.requestAccess(for: .video, completionHandler: {accessGranted in
//            DispatchQueue.main.async {
//                self.permissionGranted = accessGranted
//                print(accessGranted)
//                if(accessGranted == false){
////                    guard let url = URL(string: UIApplication.openSettingsURLString) else {
////                        return
////                    }
////
////                    if #available(iOS 10.0, *) {
////                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
////                    } else {
////                        UIApplication.shared.openURL(url)
////                    }
//                }
//            }
//        })
//    }
//}

struct ListExample: View {
//    @StateObject var cameraManager = CameraManager()
    @State private var showingAlert = false
    
    var body: some View {
//        VStack {
//            Text("Hello, world")
//            if cameraManager.permissionGranted {
//                //show a conditional view only if you have permission
//            }
//        }
//        .onReceive(cameraManager.$permissionGranted, perform: { (granted) in
//            if granted {
//                //show image picker controller
//                print(123)
//            }
//        })
//        .onAppear {
//            cameraManager.requestPermission()
//        }
        Button("Show Alert") {
                    self.showingAlert = true
                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("请在Iphone的“设置->隐私->相机”选项中，允许IM访问您的相机"),
                        primaryButton: .default(
                            Text("取消")
                        ),
                        secondaryButton: .default(
                            Text("设置"),
                            action: {
                                guard let url = URL(string: UIApplication.openSettingsURLString) else {
                                    return
                                }
            
                                if #available(iOS 10.0, *) {
                                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                } else {
                                    UIApplication.shared.openURL(url)
                                }
                            }
                        )
                    )
                }
    }
}

