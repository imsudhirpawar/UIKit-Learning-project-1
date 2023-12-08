    //
    //  Fetch.swift
    //  7Days
    //
    //  Created by Sudhir Pawar on 14/09/23.
    //

import UIKit


class Fetch: UIViewController {
    
    let tableView = UITableView()
    private var users: [UserEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        tableView.frame = view.bounds
        
        view.addSubview(tableView)
        
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshData))
        navigationItem.rightBarButtonItem = refreshButton
        
    }
    
    @objc func refreshData(){
        fetchUsers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
            // Fetch users when the view appears or when you refresh
        fetchUsers()
    }
    private func fetchUsers() {
            // Fetch users from Core Data
        users = CoreDataManager.shared.fetchUsers()
        tableView.reloadData()
    }
    
    private func updateUser(user: UserEntity) {
        let alertController = UIAlertController(title: "Update User", message: "Enter new name and password", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "New Name"
        }
        
        alertController.addTextField { textField in
            textField.placeholder = "New Password"
            textField.isSecureTextEntry = true
        }
        
        let updateAction = UIAlertAction(title: "Update", style: .default) { [weak self] _ in
            if let nameTextField = alertController.textFields?.first,
               let passTextField = alertController.textFields?.last,
               let newName = nameTextField.text,
               let newPass = passTextField.text,
               !newName.isEmpty,
               !newPass.isEmpty {
                
                
                CoreDataManager.shared.upadateUser(user: user, name: newName, password: newPass)
                
                    // Refresh the data
                self?.fetchUsers()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(updateAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    private func deleteUser(user: UserEntity){
        
        let alertController = UIAlertController(title: "Deleting", message: "Are you sure?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive){ _ in
            CoreDataManager.shared.deleteUser(user: user)
            self.fetchUsers()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
       
    }
}

extension Fetch: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.password
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        
        let alertController = UIAlertController(title: "Options", message: "Choose an Option", preferredStyle: .actionSheet)
        
        let updateAction = UIAlertAction(title: "Update", style: .default){
            [weak self] _ in
            self?.updateUser(user: user)
        }
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
            self?.deleteUser(user: user)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(updateAction)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
}
