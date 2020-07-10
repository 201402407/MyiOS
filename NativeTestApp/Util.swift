//
//  Util.swift
//  NativeTestApp
//
//  Created by LDCC on 2020/07/09.
//  Copyright © 2020 LDCC. All rights reserved.
//

import Foundation
import UserNotifications

class Util : NSObject {
    // 권한 체크
    static func notiAuthCheck() {
        // Notification Auth Check
        if #available(iOS 12.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge, .providesAppNotificationSettings], completionHandler: {didAllow,Error in
                print("[INFO] iOS 12.0 , User Notification Auth check : ", didAllow)
            })
        } else {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow,Error in
                print("[INFO] User Notification Auth check : ", didAllow)
            })
        }
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge], completionHandler: {didAllow, Error in
//            print("[INFO] User Notification Auth check : ", didAllow)
//            DispatchQueue.main.async {
//                NSLog("Notification Check result : ", didAllow)
////                if isPermitted {
//////                    self.makeAlertDialog(title: "Notification Auth", message: "Notification Auth Permitted!")
////                }
////                else {
//////                    self.makeAlertDialog(title: "Notification Auth", message: "Notification Auth Rejected! Recheck, please.")
////                }
//            }
//        })
    }
}
