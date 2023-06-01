//
//  AppDelegate.swift
//  TO-DO-APP
//
//  Created by Rahul on 29/05/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        DispatchQueue.main
            .asyncAfter(deadline: .now() + 0.5) {
                self.moveToTaskListScreen()
            }
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
    
    func moveToTaskListScreen() {
        let taskListModule = TaskListModule()
        
        guard let taskListController = taskListModule.build() else { return }
        
        // Create an instance of UINavigationController and set the root view controller
        let navigationController = UINavigationController(rootViewController: taskListController)
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let window = windowScene.windows.first else { return }
            // Set the navigation controller as the root view controller of the window
            window.rootViewController = navigationController
            // Make the window visible
            window.makeKeyAndVisible()
    }
}

