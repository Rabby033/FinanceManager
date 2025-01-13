//
//  AppDelegate.swift
//  FinanceManager
//
//  Created by Mahedi Hassan Rabby on 21/12/24.
//

import UIKit
import CoreData
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = UIStoryboard(name: "Onboarding", bundle: nil).instantiateViewController(withIdentifier: "OnboardingViewController")
        
        let rootViewController = vc
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        return true
    }

    // MARK: UISceneSession Lifecycle
}

import FirebaseCore
