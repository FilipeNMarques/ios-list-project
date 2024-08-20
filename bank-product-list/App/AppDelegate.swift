//
//  AppDelegate.swift
//  bank-product-list
//
//  Created by Filipe Marques on 20/08/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        let homeViewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: homeViewController)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}
