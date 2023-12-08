//
//  CollectionViewController.swift
//  7Days
//
//  Created by Sudhir Pawar on 12/09/23.
//

import UIKit

class CollectionViewController: UIViewController {
    
    
   var photos = ["Sudhir Pawar", "Chintu", "Uday Kotla", "Saikumar", "Suraj Gupta","Sudhir Pawar", "Chintu", "Uday Kotla", "Saikumar", "Suraj Gupta","Sudhir Pawar", "Chintu", "Uday Kotla", "Saikumar", "Suraj Gupta","Sudhir Pawar", "Chintu", "Uday Kotla", "Saikumar", "Suraj Gupta","Sudhir Pawar", "Chintu", "Uday Kotla", "Saikumar", "Suraj Gupta"]
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        addConstraints()
    }
    
    private func setUp(){
        title = "Collection View"
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    private func addConstraints(){
        
        NSLayoutConstraint.activate([
        
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}



extension CollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.photoImage.image = UIImage(named: photos[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2 - 20, height: 220)
    }
    
    
}
