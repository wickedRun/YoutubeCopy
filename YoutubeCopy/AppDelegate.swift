//
//  AppDelegate.swift
//  YoutubeCopy
//
//  Created by wickedRun on 2022/04/12.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // application.statusBarStyle = .lightContent -> info.plist에서 View controller-based status bar appearance 속성을 no로 했을때 이렇게하면 쭉 하얀색 고정
        // View controller-based status bar appearance 속성을 Yes로 했을 때
        // SceneDelegate에 정의 되어 있는 CustomNavigationView 안에
        // 아래 처럼 이 Computed Property를 override 해주면 된다. 조건문에 따라 변경도 가능하다.
        // override var preferredStatusBarStyle: UIStatusBarStyle {
        //    return .lightContent
        // }
        // 만약 statusbar 속성들을 변경했을때는
        // setNeedsStatusBarAppearanceUpdate()를 호출해준다.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

