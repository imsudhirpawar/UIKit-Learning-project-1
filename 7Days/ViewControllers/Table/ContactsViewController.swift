//
//  ContactsViewController.swift
//  7Days
//
//  Created by Sudhir Pawar on 11/09/23.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    private let contacts = ContactAPI.getContacts()
    
    let contactsTableView = UITableView()
    
   let lbl = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contactsTableView)
        
       
        
        setupNav()
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        
        contactsTableView.register(ContactCellView.self, forCellReuseIdentifier: "contactCell")
        
        
        addContstraints()
        
    }
    
    private func setupNav(){
        
       
        navigationItem.title = "Contacts"
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemTeal, .font: UIFont.boldSystemFont(ofSize: 20)]
        
        
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactCellView
        cell.contact = contacts[indexPath.row]
        return cell
    }
   
    private func addContstraints(){
        
        let guid = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
        
            contactsTableView.topAnchor.constraint(equalTo: guid.topAnchor),
            contactsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contactsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contactsTableView.bottomAnchor.constraint(equalTo: guid.bottomAnchor)
            
        ])
    }
   

}
