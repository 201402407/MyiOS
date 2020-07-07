//
//  SubViewController.swift
//  NativeTestApp
//
//  Created by LDCC on 2020/07/06.
//  Copyright © 2020 LDCC. All rights reserved.
//

import Foundation
import UIKit

class SubViewController : UIViewController {
    
    // onCreate 와 같은 뜻
    // 화면이 처음 만들어질 때 한 번만 실행됨
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func movePrevView(_ sender: Any) {
        print("[START] move previous View!")
        
//        guard let subVC = self.storyboard?.instantiateViewController(withIdentifier: "subView") else { return }
//
//        self.present(subVC, animated: false, completion: nil)
        
        // presentingViewController : VC2(SubView) 에서 VC1(MainView) 을 참조하려할 때 사용. MainViewController
        // presentedViewController : VC1(MainView) 에서 VC2(SubView) 을 참조하려할 때 사용. SubViewController
        // dismiss의 주체는 VC1 이기 때문에 VC1 참조
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // 공유하기 기능
    @IBAction func shareInfo(_ sender: Any) {
        var objectsToShare = [String]()
        for i in 1 ... 10 {
            objectsToShare.append(String(i) + " ")
        }
        
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
//        activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList]
        self.present(activityVC, animated: true, completion: nil)
        
//        let imageShare = self.viewModel.photos
//        guard imageShare.count > 0 else { return }
//
//        let activityViewController = UIActivityViewController(activityItems: imageShare, applicationActivities: nil)
//        activityViewController.popoverPresentationController?.sourceView = self.view
//        self.present(activityViewController, animated: true, completion: nil)
    }
}
