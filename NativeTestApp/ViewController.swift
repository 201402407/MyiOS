//
//  ViewController.swift
//  NativeTestApp
//
//  Created by LDCC on 2020/07/06.
//  Copyright © 2020 LDCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // onCreate 와 같은 뜻
    // 화면이 처음 만들어질 때 한 번만 실행됨
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // Alert Dialog 호출 버튼 이벤트
    @IBAction func makeAlertDialog(_ sender: Any) {
        print("[START] make Alert Dialog!")
        makeAlertDialog()
    }
    
    // ActionSheet Dialog 호출 버튼 이벤트
    @IBAction func makeActionSheetDialog(_ sender: Any) {
        print("[START] make ActionSheet Dialog!")
        makeAlertDialog(false)
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
        // UIModalTransitionStyle.partialCurl : 화면 오른쪽 아래에서 페이지가 올라가는 효과로 전환
        subVC.modalTransitionStyle = .flipHorizontal
        
        self.present(subVC, animated: true, completion: nil)
    }
    
    @IBAction func moveNextViewByNC(_ sender: Any) {
        print("[START] move Next View By Navigation Controller!")
        guard let subVC = self.storyboard?.instantiateViewController(withIdentifier: "subView") else { return }
        self.navigationController?.pushViewController(subVC, animated: true)
    }
    
    // Alert Dialog 생성
    func makeAlertDialog(_ isAlert : Bool = true) {

        // alert : 가운데에서 출력되는 Dialog. 취소/동의 같이 2개 이하를 선택할 경우 사용. 간단명료 해야함.
        let alert = isAlert ? UIAlertController(title: "TEST", message: "Alert Style 입니다.", preferredStyle: .alert)
        // actionSheet : 밑에서 올라오는 Dialog. 3개 이상을 선택할 경우 사용
        : UIAlertController(title: "TEST", message: "ActionSheet Style 입니다.", preferredStyle: .actionSheet)
        
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
}

