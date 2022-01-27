//
//  Instaklsjd.swift
//  IM
//
//  Created by admin on 2022/1/27.
//

import Foundation

class TestInd {
    static let shared = TestInd()
    
    private init() {
        print("init")
    }
    
    func testst(){
        print(456)
    }
}
