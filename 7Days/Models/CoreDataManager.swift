//
//  CoreDataManager.swift
//  7Days
//
//  Created by Sudhir Pawar on 14/09/23.
//

import UIKit

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private let appDelegateInstance = UIApplication.shared.delegate as! AppDelegate
    
    func createUser(name: String, password: String){
        
        let user = UserEntity(context: context)
        user.name = name
        user.password = password
        
        appDelegateInstance.saveContext()
        
    }
    
    func fetchUsers() -> [UserEntity]{
        let fetchRequest = UserEntity.fetchRequest()
        do{
            let savedUsers = try context.fetch(fetchRequest)
            return savedUsers
        }catch{
            print("Error fetching data: \(error.localizedDescription)")
            return []

        }
    }
    
    
    func upadateUser(user: UserEntity, name: String, password: String){
        user.name = name
        user.password = password
        
        appDelegateInstance.saveContext()
    }
    
    func deleteUser(user: UserEntity){
        context.delete(user)
        appDelegateInstance.saveContext()
    }
    

}
