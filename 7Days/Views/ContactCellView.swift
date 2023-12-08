    //
    //  ContactCellView.swift
    //  7Days
    //
    //  Created by Sudhir Pawar on 11/09/23.
    //

import UIKit

class ContactCellView: UITableViewCell{
    
    var contact: Contact? {
        
        didSet{
            
            guard let contactItem = self.contact else { return }
            
            if let name = contactItem.name {
                
                profileView.image = UIImage(named: name)
                nameLabel.text = name
                
            }
            
            if let jobTitletext = contactItem.jobTitle {
                jobTitle.text = "\(jobTitletext)"
            }
            
        }
        
    }
    
    let containerView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        
        return view
    }()
    
    let profileView: UIImageView = {
        
        let img = UIImageView()
        img.contentMode = .scaleAspectFill  //to maintain aspect ratio
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 25
        img.clipsToBounds = true
        
        return img
    }()
    
    
    let nameLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .systemBrown
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    let jobTitle: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(profileView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(jobTitle)
        self.contentView.addSubview(containerView)
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func addConstraints(){
        
        NSLayoutConstraint.activate([
            
            profileView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            profileView.widthAnchor.constraint(equalToConstant: 50),
            profileView.heightAnchor.constraint(equalToConstant: 50),
            profileView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            
            
            containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.profileView.trailingAnchor, constant: 30),
            containerView.heightAnchor.constraint(equalToConstant: 40),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),

            
            jobTitle.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            jobTitle.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
            jobTitle.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            jobTitle.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
            
            
        ])
    }
    
}


