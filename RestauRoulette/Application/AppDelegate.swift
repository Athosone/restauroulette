//
//  AppDelegate.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 28/06/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import UIKit
import ReSwift

let store = Store(
    reducer: appReducer,
    state: nil,
    middleware: [])

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let navigationController = AppNavigationContoller()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        store.dispatch(NavigationAction.appDidLaunch(window!, launchOptions))
        return true
    }
}
