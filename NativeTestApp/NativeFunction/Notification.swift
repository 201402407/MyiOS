//
//  Notification.swift
//  NativeTestApp
//
//  Created by LDCC on 2020/07/09.
//  Copyright © 2020 LDCC. All rights reserved.
//

import UIKit
import UserNotifications

class Notification : NSObject, UNUserNotificationCenterDelegate {
    private let currentVC : UIViewController
    
    init(_ vc: UIViewController) {
        self.currentVC = vc
    }
    
    // Notification 생성 및 출력
    func getNoti(title: String, subtitle: String, body: String, badge: Int = 1, identifier: String = "test") {
        let content = makeNotiContent(title: title, subtitle: subtitle, body: body, badge: badge)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false) // 무조건 Notification의 TimeInterval 을 설정해야 한다.
        let noti = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        
        center.delegate = self
        center.add(noti, withCompletionHandler: nil)    // NotificationRequest를 Queue에 Add. 그래서 Queue에서 하나씩 알람을 꺼내는 방식.
        NSLog("getNotification")
    }
    
    // Notification Content 생성
    func makeNotiContent(title: String, subtitle: String, body: String, badge: Int) -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.badge = NSNumber(value: badge)
        return content
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        //do whatever you want to here
        print("asgsga222")
        completionHandler()
    }
    
    @available(iOS 12.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent
        notification: UNNotification, withCompletionHandler completionHandler:
        @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Test Foreground: \(notification.request.identifier)")
        completionHandler([.alert, .sound])
    }
}
