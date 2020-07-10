//
//  TripleViewController.swift
//  NativeTestApp
//
//  Created by LDCC on 2020/07/10.
//  Copyright © 2020 LDCC. All rights reserved.
//

import Foundation
import UIKit

class ThirdViewController : UIViewController {

    let image = UIImage(named: "temp1.jpg")
    let imageWidth: CGFloat = 250
    let imageHeight: CGFloat = 400
    
    // UILabel 객체 리턴
    lazy var testImageLabel: UILabel = {
        let posX: CGFloat = self.view.bounds.width / 2 // 이미지 가운데 정렬
        let posY: CGFloat = 250
        
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 200, width: self.view.bounds.width, height: 90))
//        label.center.x = posX
        label.textAlignment = .center
        label.textColor = .red
        label.text = "TEST IMAGE"
        
        return label
    }()
    
    // ImageView 객체 리턴
    lazy var testImageView: UIImageView = {
        let posX: CGFloat = (self.view.bounds.width - self.imageWidth) / 2 // 이미지 가운데 정렬
        let posY: CGFloat = 300
        
        // ImageView 객체 생성
        let imageView: UIImageView = UIImageView(frame: CGRect(x: posX, y: posY, width: self.imageWidth, height: self.imageHeight))
        
        imageView.image = self.image
        imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.testImageLabel)
        self.view.addSubview(self.testImageView)
    }
}
