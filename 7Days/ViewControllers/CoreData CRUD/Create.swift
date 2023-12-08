//
//  LoginViewController.swift
//  7Days
//
//  Created by Sudhir Pawar on 14/09/23.
//

import UIKit

class Create: UIViewController {

        // MARK: - UI Elements
        
        private let nameLabel: UILabel = {
            let label = UILabel()
            label.text = "Name:"
            label.font = .boldSystemFont(ofSize: 18)
            label.textColor = .systemMint
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let nameTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Enter Your Name"
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
        
        private let passwordLabel: UILabel = {
            let label = UILabel()
            label.text = "Password:"
            label.font = .boldSystemFont(ofSize: 18)
            label.textColor = .systemMint
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let passwordTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Enter Pass"
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
        
        private let registerButton: UIButton = {
            let button = UIButton()
            button.configuration = .tinted()
            button.configuration?.title = "Register"
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        // MARK: - View Lifecycle
        
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "CoreData"
            view.backgroundColor = .systemBackground
            setUp()
            addConstraints()
            registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        }
    
    @objc func register(){
        
        guard let name = nameTextField.text, !name.isEmpty,
                 let password = passwordTextField.text, !password.isEmpty else {
               return
           }
        
        CoreDataManager.shared.createUser(name: name, password: password)
        nameTextField.text = ""
        passwordTextField.text = ""
        
        print("Created")
            // Swift
            // Swift
        navigationController?.popViewController(animated: true)
   
    }
        
        // MARK: - Private Methods
        
        private func setUp() {
            view.addSubview(nameLabel)
            view.addSubview(nameTextField)
            view.addSubview(passwordLabel)
            view.addSubview(passwordTextField)
            view.addSubview(registerButton)
        }
    
    private func addConstraints() {
        let guid = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: guid.topAnchor, constant: 200),
            nameLabel.leadingAnchor.constraint(equalTo: guid.leadingAnchor, constant: 50),
            
            nameTextField.topAnchor.constraint(equalTo: guid.topAnchor, constant: 200),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 70),
            passwordLabel.leadingAnchor.constraint(equalTo: guid.leadingAnchor, constant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 90),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.trailingAnchor, constant: 50),
            
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            registerButton.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}
