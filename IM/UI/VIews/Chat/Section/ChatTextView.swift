//
//  ChatTextView.swift
//  IM
//
//  Created by admin on 2022/2/7.
//

import SwiftUI

struct ChatTextView: UIViewRepresentable {
    typealias Context = UIViewRepresentableContext<ChatTextView>
    
    @Binding var text: String
    @Binding var height: CGFloat
    
    let width: CGFloat
    
    func makeUIView(context: Context) -> UIView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.font = .preferredFont(forTextStyle: .body)
        textView.isScrollEnabled = true
        textView.backgroundColor = .white
        
        let uiView = UIView()
        uiView.addSubview(textView)
        
        return uiView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        let textView = uiView.subviews.first! as! UITextView
        
        if !context.coordinator.isEditing {
            textView.text = text
        }
        
        let bounds = CGSize(width: width, height: height)
        
        DispatchQueue.main.async {
            if (textView.sizeThatFits(bounds).height < 105) {
                height = textView.sizeThatFits(bounds).height
            }else{
                height = 105
            }
            let size = CGSize(width: width, height: height)
            uiView.frame.size = size
            textView.frame.size = size
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var text: Binding<String>
        var isEditing: Bool = false
        
        init(text: Binding<String>) {
            self.text = text
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.text.wrappedValue = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            isEditing = true
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            isEditing = false
        }
    }
}
