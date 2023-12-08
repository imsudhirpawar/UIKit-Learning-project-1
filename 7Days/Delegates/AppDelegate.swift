    //
    //  AppDelegate.swift
    //  7Days
    //
    //  Created by Sudhir Pawar on 04/09/23.
    //

import UIKit
import CoreData
import GooglePlaces

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchingOptions: [UIApplication.LaunchOptionsKey :Any]?) -> Bool {
        
        GMSPlacesClient.provideAPIKey("AIzaSyAqf81Wd4IAfzzxeMMHph5MlOLvtxFLxjE")
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.white
        
        let controller = UINavigationController(rootViewController: MainViewController())
        
        window?.rootViewController = controller

        return true
    }
    
    
    
        // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
        // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    
    
}

