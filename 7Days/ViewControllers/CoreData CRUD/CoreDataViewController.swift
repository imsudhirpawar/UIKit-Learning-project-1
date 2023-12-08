//
//  CreateUserViewController.swift
//  7Days
//
//  Created by Sudhir Pawar on 14/09/23.
//

import UIKit

class CoreDataViewController: UIViewController {

    
    let createButton = UIButton()
    let fetchButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUP()
        addContstraints()
        
    }
    
    
    
    private func setUP(){
        
        title = "CRUD"
        createButton.configuration = .tinted()
        createButton.configuration?.title = "Create"
        createButton.configuration?.image = UIImage(systemName: "plus")
        createButton.configuration?.imagePadding = 8
        createButton.tintColor = .systemBlue
        createButton.addTarget(self, action: #selector(goToCreate), for: .touchUpInside)
        
        
        
        createButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(createButton)
        
        
        fetchButton.configuration = .tinted()
        fetchButton.configuration?.title = "Fetch"
        fetchButton.configuration?.image = UIImage(systemName: "display")
        fetchButton.configuration?.imagePadding = 8
        fetchButton.tintColor = .systemTeal
        fetchButton.addTarget(self, action: #selector(goToFetch), for: .touchUpInside)
        
        
        
        fetchButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fetchButton)

    }
    
    
    @objc func goToCreate(){
        let createVC = Create()
        self.navigationController?.pushViewController(createVC, animated: true)
  
    }
    
    @objc func goToFetch(){
        let fetchVC = Fetch()
        self.navigationController?.pushViewController(fetchVC, animated: true)
  
    }
    
    
    private func addContstraints(){
        
        NSLayoutConstraint.activate([
        
        
            createButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            createButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100),
            createButton.widthAnchor.constraint(equalToConstant: 200),
            createButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            fetchButton.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: 70),
            fetchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fetchButton.widthAnchor.constraint(equalToConstant: 200),
            fetchButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }

   

}
