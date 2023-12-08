    //
    //  ProfileViewController.swift
    //  7Days
    //
    //  Created by Sudhir Pawar on 04/09/23.
    //

import UIKit

class ProfileViewController: UIViewController {
    
    var lbl = UILabel()
    
    var textfield = UITextField()
    
    var submitButton = UIButton()
    
    var delegate: DataTransferDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lbl)
        view.addSubview(textfield)
        view.addSubview(submitButton)
        view.backgroundColor = .systemBackground
        
        
        
        
        lbl.textColor = .systemRed
        lbl.text = "Write new button name here"
        
        textfield.layer.borderWidth = 0.3
        textfield.placeholder = "Button Name"
        textfield.borderStyle = .roundedRect
        textfield.layer.cornerRadius = 8
        
        
        
        submitButton.configuration = .tinted()
        submitButton.configuration?.title = "Submit"
        submitButton.configuration?.image = UIImage(systemName: "checkmark")
        submitButton.configuration?.imagePadding = 8
        submitButton.tintColor = .systemPurple
        submitButton.addTarget(self, action: #selector(buttonSubmit), for: .touchUpInside)
        
        
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        textfield.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        addConstraints()
        
    }
    
    
    @objc func buttonSubmit(){
        
        if let data = textfield.text {
            delegate?.didReceivedData(data: data )
            
        }
        
        
        let alertController = UIAlertController(title: "Sucess", message: "Button renamed. You can go back to main view", preferredStyle: .alert)
        
            
        let okAction = UIAlertAction(title: "OK", style: .default) { [self] (_) in
            
            print("OK button tapped")
            textfield.text = ""
        }
        
            
        alertController.addAction(okAction)
        
            
        present(alertController, animated: true, completion: nil)
    }
    
    
    private func addConstraints(){
        
        NSLayoutConstraint.activate([
            
            lbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            lbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            textfield.topAnchor.constraint(equalTo: lbl.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            textfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            
            submitButton.topAnchor.constraint(equalTo: textfield.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
   
}





