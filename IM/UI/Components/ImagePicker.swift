//
//  ImagePicker.swift
//  IM
//
//  Created by admin on 2022/1/20.
//
//  相册选择器
//

import SwiftUI
import UIKit

//  如果想在SwiftUI中调用UIKit组件，就要使用 UIViewControllerRepresentable 接口并实现它要求的两个接口方法 makeUIViewController 和 updateUIViewController
//  makeUIViewController 用来创建对应的组件对象并且做一些初始化的工作。
//  updateUIViewController 往往用来创建好对象后，根据上下文情景做一些数据更新。

//  UIKit 有一个叫 UIViewController 的类，被设计用于持有实操视图的代码
//  UIKit 采用委托设计模式来确定工作分工。因此，当我们要确定要如何响应某个文本框里的值变化时，我们会创建一个自定义类，充当文本框的委托。
//  UIKit 是采用一个叫 UIImagePickerController 的视图控制来给用户从相册中选择照片，而它的委托协议叫 UINavigationControllerDelegate 和 UIImagePickerControllerDelegate
//  把presentationMode也添加到 ImagePicker，以便我们可以通过程序化手段关闭视图

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    let sourceType: UIImagePickerController.SourceType
    let onImagePicked: (UIImage) -> Void
 
    //  在 ImagePicker 结构体中写一个嵌套类，使用嵌套类的好处是能够使代码封装更整洁
    //  尽管这个类处于 UIViewControllerRepresentable 结构体中，SwiftUI 不会自动应用这个类作为视图的 coordinator。相反，我们需要添加一个叫 makeCoordinator() 的新方法，如果有实现这个方法，SwiftUI 会自动调用它
    //  使得类继承 NSObject，它几乎是 UIKit 里一切东西的父类。NSObject 使得 Objective-C 能够向对象询问其支持的运行时功能，也就是说，image picker 可以发出这些的提问 “现在用户选择了一张图片，你打算怎么做？”
    //  使得类遵循 UIImagePickerControllerDelegate 协议，这个协议添加了侦测到用户选择图片后的应对功能（NSObject 让 Objective-C 检查功能，而这个协议实际提供功能）
    //  使得类遵循 UINavigationControllerDelegate 协议，这个协议能够侦测到用户在 image picker 的不同屏之间移动的行为。
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
 
        @Binding private var presentationMode: PresentationMode
        private let sourceType: UIImagePickerController.SourceType
        private let onImagePicked: (UIImage) -> Void
 
        init(presentationMode: Binding<PresentationMode>,
             sourceType: UIImagePickerController.SourceType,
             onImagePicked: @escaping (UIImage) -> Void) {
            _presentationMode = presentationMode
            self.sourceType = sourceType
            self.onImagePicked = onImagePicked
        }
 
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            onImagePicked(uiImage)
            presentationMode.dismiss()
        }
 
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            presentationMode.dismiss()
        }
 
    }
 
    func makeCoordinator() -> Coordinator {
        return Coordinator(presentationMode: presentationMode,sourceType: sourceType,onImagePicked: onImagePicked)
    }
    
    //  使用UIImagePickerController组件，可以调用手机的相册或者拍照功能。
    //  首先在makeUIViewController创建它。
    //  sourceType用来指定图片选择的来源。photoLibrary代表相册，camera代表拍照获取。
    //  delegate 自己的任务委托给其他人去做
    //  SwiftUI 的 coordinators 被设计来扮演 UIKit 视图控制器的委托的角色。
    //  让 UIImagePickerController 知道，当事件发生时，让委托的 coordinator 处理。
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
 
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
}
