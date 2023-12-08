//
//  CollectionViewCell.swift
//  7Days
//
//  Created by Sudhir Pawar on 12/09/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    var photoImage: UIImageView = {
        
        let img = UIImageView()
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(photoImage)
        
        NSLayoutConstraint.activate([
            photoImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            photoImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            photoImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
