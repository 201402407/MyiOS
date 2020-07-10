//
//  SubViewController.swift
//  NativeTestApp
//
//  Created by LDCC on 2020/07/06.
//  Copyright © 2020 LDCC. All rights reserved.
//

import Foundation
import UIKit

class SubViewController : UIViewController, UITextFieldDelegate {
    
    // weak : 약한 참조(strong reference 와는 반대)
    // 즉, 참조는 하지만 참조 카운트는 증가하지 않는다.
    // 참조 카운트가 0이 되면 메모리가 해제되는데, strong <-> strong 참조가 하나라도 있으면 메모리가 해제되지 않는다.
    // 그래서 잘못하면 해당 메모리에 직접 접근할 수 없지만, 메모리가 해제되지 않아 메모리 누수(memory leak)가 발생할 수 있다.
    // 이를 방지하기 위한 방법
    @IBOutlet weak var textField: UITextField! {
        didSet {
            print("[START] SubView Didset!")
            textField.delegate = self
        }
    }
    
    // init : 해딩 클래스 객체가 메모리를 부여받을 때(객체 생성 시) 호출되는 함수
    // designated init(그냥 init)과 convenience init의 차이
    // designated init은 해당 클래스의 변수들을 전부 파라미터로 가져와서 초기화해야 하지만,
    // convenience init은 designated init을 호출하기만 하면 되고, 추가로 사용자가 원하는 코드를 넣어 초기화를 보조한다.
//    convenience init() {
//        self.init()
//        print("[START] SubView Memory Get!")
//    }
    
    // deinit : 해당 클래스 객체가 메모리에서 해제될 경우 호출되는 함수
    deinit {
        print("[END] SubView Memory Release!")
    }
    
    // onCreate 와 같은 뜻
    // 해당 화면이 처음 만들어질 때 한 번만 실행됨
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
//        textField.delegate = self
        
    }
    @IBAction func movePrevView(_ sender: Any) {
        print("[START] move previous View!")
        
        // presentingViewController : VC2(SubView) 에서 VC1(MainView) 을 참조하려할 때 사용. MainViewController
        // presentedViewController : VC1(MainView) 에서 VC2(SubView) 을 참조하려할 때 사용. SubViewController
        // dismiss의 주체는 VC1 이기 때문에 VC1 참조
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // 공유하기 기능
    @IBAction func shareInfo(_ sender: Any) {
        var objectsToShare = [String]()
        if let text = textField.text {
            objectsToShare.append(text)
            print("[INFO] textField's Text : ", text)
        }
        
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
//        activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList]
        self.present(activityVC, animated: true, completion: nil)
    }
    
    // 노티 알람 출력
    @IBAction func getNotification(_ sender: Any) {
        Notification(self).getNoti(title: "Notification Test", subtitle: "Noti 알람 테스트 입니다.", body: "현재 이 Noti 알람이 보이면 정상 작동되는 것입니다.")
    }
    
    // 사용자가 처음 화면을 터치할 때 호출
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // textField Return 키 누를 시 이벤트 처리 함수
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
