//
//  AppDelegate.swift
//  NativeTestApp
//
//  Created by LDCC on 2020/07/06.
//  Copyright © 2020 LDCC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    var mainViewTabNavigationController : UINavigationController!
    var subViewTabNavigationController : UINavigationController!
    var thirdViewTabNavigationController : UINavigationController!
    
    // 앱을 실행하면 호출되는 메소드. launchOptions 인자를 통해 앱이 실행하게 된 이유(ex. 푸시) 등이 포함되어 실행한다.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Util.notiAuthCheck()
//        self.initTabBar()
        
//        window = UIWindow(frame: UIScreen.main.bounds)
        
        //1. 탭바 컨트롤러를 생성하고, 배경을 흰색으로 한다.
        let tabBarController = UITabBarController()
        tabBarController.view.backgroundColor = .darkGray

        //2.각 탭바 아이템에 연결될 뷰 컨트롤러 객체를 생성한다.
        mainViewTabNavigationController = UINavigationController.init(rootViewController: ViewController())
        subViewTabNavigationController = UINavigationController.init(rootViewController: SubViewController())
        thirdViewTabNavigationController = UINavigationController.init(rootViewController: ThirdViewController())
        
        //3.생성된 뷰 컨트롤러 객체들을 탭 바 컨트롤러에 등록한다.
        tabBarController.setViewControllers([mainViewTabNavigationController,subViewTabNavigationController,thirdViewTabNavigationController], animated: true)

        //4. 개별 탭바 아이템 속성을 설정한다.
        mainViewTabNavigationController.tabBarItem = UITabBarItem(title:"Main",image:UIImage(named:"temp1.jpg"), tag: 0)
        subViewTabNavigationController.tabBarItem = UITabBarItem(title:"Sub",image:UIImage(named:"temp2.jpg"), tag: 1)
        thirdViewTabNavigationController.tabBarItem = UITabBarItem(title:"Third",image:UIImage(named:"temp3.jpg"), tag: 2)
//        thirdViewTabNavigationController.tabBarItem = UITabBarItem(title:"Third",image:UIImage(named:"ico-profile"), selectedImage: nil)

        //5.생성된 tbC를 루트뷰 컨트롤러로 등록한다. : 윈도우 객체가 참조하는 뷰컨트롤러가 곧 루트 뷰 컨트롤러다.
//        self.window?.rootViewController = tabBarController
        window?.rootViewController = UINavigationController(rootViewController: tabBarController)
        window?.makeKeyAndVisible()
        
//        UNUserNotificationCenter.current().delegate = self
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    

    // 앱이 화면에 활성화되면 호출
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    // 홈 버튼 누르면 백그라운드로 이동하는데, 화면에서 APP이 사라지면서 가장 먼저 호출됨
    // Task 일시정지, 타이머 비활성화 등을 구현하는 로직 넣는듯
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    // 앱이 백그라운드로 이동 후에 호출되는 함수. 화면에서 앱이 보이지 않을 때 호출된다.
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    // 앱이 다시 포그라운드로 올라올 때 호출되는 함수
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    // Tab bar Setting
    func initTabBar() {
        //1. 탭바 컨트롤러를 생성하고 , 배경을 흰색으로 한다.
        let tabBarController = UITabBarController()
        tabBarController.view.backgroundColor = .darkGray


        //2.생성된 tbC를 루트뷰 컨트롤러로 등록한다. : 윈도우 객체가 참조하는 뷰컨트롤러가 곧 루트 뷰 컨트롤러다.
        self.window?.rootViewController = tabBarController

        //3.각 탭바 아이템에 연결될 뷰 컨트롤러 객체를 생성한다.
        let view01 = ViewController()
        let view02 = SubViewController()
        let view03 = ThirdViewController()
        
        //4.생성된 뷰 컨트롤러 객체들을 탭 바 컨트롤러에 등록한다.
        tabBarController.setViewControllers([view01,view02,view03], animated: true)

        //5. 개별 탭바 아이템 속성을 설정한다.
        view01.tabBarItem = UITabBarItem(title:"Main",image:UIImage(named:"calendar"), selectedImage: nil)
        view02.tabBarItem = UITabBarItem(title:"Sub",image:UIImage(named:"file-tree"), selectedImage: nil)
        view03.tabBarItem = UITabBarItem(title:"Third",image:UIImage(named:"photo"), selectedImage: nil)

        //주의: 탭 바 아이템을 참조할 때 탭바 컨트롤러 -> 탭바 -> 탭바 아이템 순으로 참조(x)
        //뷰 컨트롤러에서 직접 탭바를 참조해야 한다.
        //이유: 탭바 아이템은 각각의 뷰 컨트롤러에 연결되어 있는 속성이다. 탭바 컨트롤러 하위에 뷰컨트롤러가 연결되면 탭바 컨트롤러는 각각의 뷰컨트롤러에게 탭바 아이템을 제공한다.
        //이같은 매커니즘으로 인해 탭 바 아이템의 소유권은 탭바가 아닌 뷰 컨트롤러가 된다.
        // 뷰 컨트롤러 -> 탭바 아이템 형식으로 참조한다.
        
//        if let tabBarController = self.window?.rootViewController as? UITabBarController{
//                    //2.탭바로 부터 탭 바 아이템 배열을 가져 온다.
//                   if let tbItems =  tabBarController.tabBar.items{
//                    //tbItems[0].image = UIImage(named:"calendar")
//                    //tbItems[1].image = UIImage(named:"file-tree")
//                    //tbItems[2].image = UIImage(named:"photo")
//
//                    //커스텀 탭바 아이템으로 변경시키기 - 랜더링 메소드 이용!
//                    tbItems[0].image = UIImage(named:"designbump")?.withRenderingMode(.alwaysOriginal)
//                    tbItems[1].image = UIImage(named:"rss")?.withRenderingMode(.alwaysOriginal)
//                    tbItems[2].image = UIImage(named:"facebook")?.withRenderingMode(.alwaysOriginal)
//
//                    //탭바 아이템 전체를 순회하면서 selectedImage 속성에 이미지를 설정한다. -- 랜더링 메소드 이용!
//                    for tbItem in tbItems{
//                        let image = UIImage(named: "checkmark")?.withRenderingMode(.alwaysOriginal)
//                        tbItem.selectedImage = image
//
//                        //탭바 아이템 타이틀 색깔 속성값 변경하기. - 선택 안되었을때
//                        tbItem.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.darkGray], for: .disabled)
//
//                        //선택 되었을 때
//                        tbItem.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.blue], for: .selected)
//
//                        //탭바 아이템의 폰트 값 설정
//                        tbItem.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.systemFont(ofSize: 15)], for: .highlighted)
//                    }
//
//                    //외형 프록시 객체를 이용하여 아이템의 타이틀 색상과 폰트 크기를 설정한다.
//                    //외형 프록시 객체는 화면 요소별 속성을 공통으로 적용할 수 있는 객체다.
//                    //외형 프록시 객체에 속성을 설정해두면 해당 타입으로 생성된 모든 객체에 해당 속성이 적용된다.
//                    //let tbItemProxy = UITabBarItem.appearance()
//                    //tbItemProxy.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue) : UIColor.red], for: .selected)
//                    //tbItemProxy.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue) : UIColor.red], for: .disabled)
//                    //tbItemProxy.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue) : UIFont.systemFont(ofSize: 15)], for: .normal)
//
//
//                    //3. 탭 바 아이템에 타이틀을 설정한다.
//                    tbItems[0].title = "Main"
//                    tbItems[1].title = "Sub"
//                    tbItems[2].title = "Triple"
//                    }
//
//                    //4.활성화된 탭 바 아이템의 이미지 색상을 변경한다.
//                    //tbC.tabBar.tintColor = UIColor.white
//                    //tbC.tabBar.backgroundImage = UIImage(named:"menubar-bg-mini")
//
//                    //let image = UIImage(named: "menubar-bg-mini")!
//                    //tbC.tabBar.barTintColor = UIColor(patternImage: image)
//
//                    //인자값으로 입력된 x좌표의 이미지만 늘어나고, x좌표를 기준으로 분할된 좌우측의 이미지는 나뉘어 양쪽 끝에 밀착하게 된다.
//                    //let bg = UIImage(named: "connectivity-bar")?.stretchableImage(withLeftCapWidth: 5, topCapHeight: 16)
//                    //tbC.tabBar.backgroundImage = bg
//
//
//                    //참고 tbC.tabBar.clipsToBounds = true // 탭바에서 넘쳐나는 이미지 잘라내기
//        }
    }
}

