//
//  ViewController.swift
//  NativeTestApp
//
//  Created by LDCC on 2020/07/06.
//  Copyright © 2020 LDCC. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    // onCreate 와 같은 뜻
    // 화면이 처음 만들어질 때 한 번만 실행됨
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.addSubview(MyTabBarController().view)
        
        
//        let testImageViewController = UIImageView
//        self.authCheck()
    }

    // Alert Dialog 호출 버튼 이벤트
    @IBAction func getAlertDialog(_ sender: Any) {
        print("[START] make Alert Dialog!")
        makeAlertDialog(title: "TEST", message: "Alert Dialog")
    }
    
    // ActionSheet Dialog 호출 버튼 이벤트
    @IBAction func getActionSheetDialog(_ sender: Any) {
        print("[START] make ActionSheet Dialog!")
//        makeAlertDialog(title: "TEST", message: "Alert Dialog", false)
//        Notification(self).getNoti(title: "asd", subtitle: "ff", body: "ggasg")
        
        // 화면 출력(present) 종류
        let tabBarViewController = MyTabBarController()
        tabBarViewController.modalTransitionStyle = .crossDissolve
        tabBarViewController.modalPresentationStyle = .overCurrentContext
        self.present(tabBarViewController, animated: true, completion: nil)
    }
    
    // 다음 ViewController 이동 호출 버튼 이벤트
    @IBAction func moveNextView(_ sender: Any) {
        print("[START] move Next View!")
        // 다른 storyboard의 VC 객체 가져오기
        // present로 VC 실행
        guard let subVC = self.storyboard?.instantiateViewController(withIdentifier: "subView") else { return }
        
        // 화면 전환 스타일 설정
        // UIModalTransitionStyle.coverVertical : 아래에서 위로 올라가면서 전환
        // UIModalTransitionStyle.crossDissolve : 전화면에서 다음화면이 교차되며 뚜렷하게 표현되는 전환
        // UIModalTransitionStyle.flipHorizontal : 화면 중앙 축을 기준으로 회전하며 전환
        // UIModalTransitionStyle.partialCurl : 화면 오른쪽 아 래에서 페이지가 올라가는 효과로 전환
        subVC.modalTransitionStyle = .crossDissolve
 
        // 화면 출력(present) 종류
        subVC.modalPresentationStyle = .overCurrentContext
        
        self.present(subVC, animated: true, completion: nil)
    }
    
    @IBAction func moveNextViewByNC(_ sender: Any) {
        print("[START] move Next View By Navigation Controller!")
        guard let subVC = self.storyboard?.instantiateViewController(withIdentifier: "subView") else { return }
        self.navigationController?.pushViewController(subVC, animated: true)
    }
    
    // Alert Dialog 생성
    func makeAlertDialog(title: String, message: String, _ isAlert : Bool = true) {

        // alert : 가운데에서 출력되는 Dialog. 취소/동의 같이 2개 이하를 선택할 경우 사용. 간단명료 해야함.
        let alert = isAlert ? UIAlertController(title: title, message: message, preferredStyle: .alert)
        // actionSheet : 밑에서 올라오는 Dialog. 3개 이상을 선택할 경우 사용
        : UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        // destructive : title 글씨가 빨갛게 변함
        // cancel : 글자 진하게
        // defaule : X
        let alertDeleteBtn = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            print("[SUCCESS] Dialog Cancel Button Click!")
        }
        let alertSuccessBtn = UIAlertAction(title: "OK", style: .default) { (action) in
            print("[SUCCESS] Dialog Success Button Click!")
        }
        
        // Dialog에 버튼 추가
        if(isAlert) {
            alert.addAction(alertDeleteBtn)
            alert.addAction(alertSuccessBtn)
        }
        else {
            alert.addAction(alertSuccessBtn)
            alert.addAction(alertDeleteBtn)
        }
//        print("alert button count : ", alert.actions.count)
        
        // 화면에 출력
        self.present(alert, animated: true, completion: nil)
    }
    
    // 권한 체크
    func authCheck() {
        var isPermitted: Bool = false
        // Notification Auth Check
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge], completionHandler: {didAllow, Error in
            print("[INFO] User Notification Auth check : ", didAllow)
            isPermitted = didAllow
            DispatchQueue.main.async {
                if isPermitted {
                    self.makeAlertDialog(title: "Notification Auth", message: "Notification Auth Permitted!")
                }
                else {
                    self.makeAlertDialog(title: "Notification Auth", message: "Notification Auth Rejected! Recheck, please.")
                }
            }
        })
    }
    
    // UIViewController의 상위 클래스인 UIResponder에는 화면 터치 관련 메소드들이 정의 되어 있다.
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tabBar = self.tabBarController?.tabBar
        // tabBar?.isHidden = (tabBar?.isHidden == true) ? false : true
        
        //애니메이션 적용해주기
        UIView.animate(withDuration:  TimeInterval(0.1)){
        tabBar?.alpha = (tabBar?.alpha == 0 ? 1 : 0)
        }
    }
}

