//
//  SceneDelegate.swift
//  TimePlayed
//
//  Created by Fernando Castor on 14/04/20.
//  Copyright © 2020 Fernando Castor. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    //========================================================================
    // To make this work without the Main storyboard, had to erase references
    // to it from both info.plist (Storyboard Name) and the general project
    // configurations, under Deployment Info (Main Interface). In addition,
    // must use an empty storyboard because, otherwise, the borders of the
    // screen will be all messed up. The app will only use a small part of
    // the screen. Is it because if we explicitly create a launch screen,
    // it will treat the view of the root view controller as the launch
    // screen?
    //========================================================================
    
    
    
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    window = UIWindow(frame: UIScreen.main.bounds)
    
    window?.backgroundColor = UIColor.red
    
    window?.windowScene = windowScene
    
    let tabBarController = UITabBarController()
    //    tabBarController.view.frame = window!.frame
    
    //let generalInfo = ViewController()
    
    let registerTimeVC = RegisterTimeViewController()
    let gamesPanelVC = GamesPanelViewController()
    
    registerTimeVC.view.backgroundColor = UIColor.red
    gamesPanelVC.view.backgroundColor = UIColor.red
    
    tabBarController.viewControllers = [registerTimeVC, gamesPanelVC]
    

    registerTimeVC.tabBarItem = UITabBarItem(title: "Log", image: UIImage(named:"plus"), tag: 0)
    gamesPanelVC.tabBarItem = UITabBarItem(title: "Games", image: UIImage(named: "changing-room")!, tag: 1)
    
    UITabBar.appearance().tintColor = UIColor(red: 248/255.0, green: 0/255.0, blue: 148/255.0, alpha: 1.0)
    
    tabBarController.view.backgroundColor = UIColor.red
    
    self.window?.rootViewController = tabBarController
    //  self.window?.rootViewController = registerTimeVC
    
    self.window?.makeKeyAndVisible()
    
    
  }
  
  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
  }
  
  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }
  
  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }
  
  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }
  
  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }
  
  
}
