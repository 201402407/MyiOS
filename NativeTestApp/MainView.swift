//
//  MainView.swift
//  NativeTestApp
//
//  Created by LDCC on 2020/07/06.
//  Copyright © 2020 LDCC. All rights reserved.
//

import UIKit

class MainView : UIView {
    // Button UI 객체 늦은 선언
    lazy var button: UIButton = {
        let button = UIButton()
        
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(button)
        
        button.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
