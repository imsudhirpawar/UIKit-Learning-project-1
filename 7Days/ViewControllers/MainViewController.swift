    //
    //  ViewController.swift
    //  7Days
    //
    //  Created by Sudhir Pawar on 04/09/23.
    //
import UIKit

class MainViewController: UIViewController {
    
    private  let lbl = UILabel()
    private  let basicControlButton = UIButton()
    private  let delegateChecherButton = UIButton()
    private  let tableViewButton = UIButton()
    private  let collectionViewButton = UIButton()
    private  let loginButton = UIButton()
    private  let locationAutocompleteAPIButton = UIButton()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBasicControlButton()
        setUpDelegateCheckerButton()
        setUpTableViewButton()
        setUpCollectionViewButton()
        setUpLoginButton()
        setUpLocationAutocompleteAPIButton()
        
        view.backgroundColor = .systemBackground
        
        
        
        addConstraints()
        
        
        self.navigationItem.title = "MainViewController"
        
        
    }
    private func setUpLocationAutocompleteAPIButton(){
        locationAutocompleteAPIButton.configuration = .tinted()
        locationAutocompleteAPIButton.configuration?.title = "Search Location"
        locationAutocompleteAPIButton.configuration?.image = UIImage(systemName: "swift")
        locationAutocompleteAPIButton.configuration?.imagePadding = 8
        locationAutocompleteAPIButton.tintColor = .systemGreen
        locationAutocompleteAPIButton.addTarget(self, action: #selector(goToLocationAutoCompleteAPI), for: .touchUpInside)
        
        
        
        locationAutocompleteAPIButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(locationAutocompleteAPIButton)
    }
    
    private func setUpLoginButton(){
        loginButton.configuration = .tinted()
        loginButton.configuration?.title = "CRUD"
        loginButton.configuration?.image = UIImage(systemName: "swift")
        loginButton.configuration?.imagePadding = 8
        loginButton.tintColor = .systemOrange
        loginButton.addTarget(self, action: #selector(goToCoreDataView), for: .touchUpInside)
        
        
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
    }
    
    private func setUpCollectionViewButton(){
        collectionViewButton.configuration = .tinted()
        collectionViewButton.configuration?.title = "CollectinoView"
        collectionViewButton.configuration?.image = UIImage(systemName: "swift")
        collectionViewButton.configuration?.imagePadding = 8
        collectionViewButton.tintColor = .systemPurple
        collectionViewButton.addTarget(self, action: #selector(goToCollectionView), for: .touchUpInside)
        
        
        
        collectionViewButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionViewButton)
    }
    
    private func setUpTableViewButton(){
        tableViewButton.configuration = .tinted()
        tableViewButton.configuration?.title = "Table View"
        tableViewButton.configuration?.image = UIImage(systemName: "swift")
        tableViewButton.configuration?.imagePadding = 8
        tableViewButton.tintColor = .systemTeal
        tableViewButton.addTarget(self, action: #selector(goToTableview), for: .touchUpInside)
        
        
        
        tableViewButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableViewButton)
    }
    
    
    private func setUpDelegateCheckerButton(){
        delegateChecherButton.configuration = .tinted()
        delegateChecherButton.configuration?.title = "Delegate Checker"
        delegateChecherButton.configuration?.image = UIImage(systemName: "swift")
        delegateChecherButton.configuration?.imagePadding = 8
        delegateChecherButton.tintColor = .systemBrown
        delegateChecherButton.addTarget(self, action: #selector(goToDelegateView), for: .touchUpInside)
        
        
        
        delegateChecherButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(delegateChecherButton)
    }
    private func setUpBasicControlButton(){
        
        basicControlButton.configuration = .tinted()
        basicControlButton.configuration?.title = "Basic Controls"
        basicControlButton.configuration?.image = UIImage(systemName: "swift")
        basicControlButton.configuration?.imagePadding = 8
        basicControlButton.tintColor = .systemBlue
        basicControlButton.addTarget(self, action: #selector(goToHomeView), for: .touchUpInside)
        
        
        
        basicControlButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(basicControlButton)
        
        
    }
    
    
    
    
    private func addConstraints(){
        
        
        NSLayoutConstraint.activate([
            
            basicControlButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            basicControlButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            basicControlButton.heightAnchor.constraint(equalToConstant: 50),
            basicControlButton.widthAnchor.constraint(equalToConstant: 280),
            
            
            delegateChecherButton.topAnchor.constraint(equalTo: basicControlButton.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            delegateChecherButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            delegateChecherButton.heightAnchor.constraint(equalToConstant: 50),
            delegateChecherButton.widthAnchor.constraint(equalToConstant: 280),
            
            
            
            tableViewButton.topAnchor.constraint(equalTo: delegateChecherButton.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            tableViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableViewButton.heightAnchor.constraint(equalToConstant: 50),
            tableViewButton.widthAnchor.constraint(equalToConstant: 280),
            
            collectionViewButton.topAnchor.constraint(equalTo: tableViewButton.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            collectionViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionViewButton.heightAnchor.constraint(equalToConstant: 50),
            collectionViewButton.widthAnchor.constraint(equalToConstant: 280),
            
            loginButton.topAnchor.constraint(equalTo: collectionViewButton.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 280),
            
            
            locationAutocompleteAPIButton.topAnchor.constraint(equalTo: loginButton.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            locationAutocompleteAPIButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationAutocompleteAPIButton.heightAnchor.constraint(equalToConstant: 50),
            locationAutocompleteAPIButton.widthAnchor.constraint(equalToConstant: 280),
            
        ])
    }
    
    @objc func goToLocationAutoCompleteAPI() {
        let vc = LocationViewController()
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    @objc func goToCoreDataView() {
        let coreDataVC = CoreDataViewController()
        self.navigationController?.pushViewController(coreDataVC, animated: true)
        
    }
    
    @objc func goToCollectionView() {
        let collectionVC = CollectionViewController()
        self.navigationController?.pushViewController(collectionVC, animated: true)
        
    }
    
    @objc func goToTableview() {
        let tableVC = ContactsViewController()
        self.navigationController?.pushViewController(tableVC, animated: true)
        
    }
    
    @objc func goToHomeView() {
        let homeVC = TabViewController()
        self.navigationController?.pushViewController(homeVC, animated: true)
        
    }
    
    
    @objc func goToDelegateView(){
        
        
        
        let homeVC = ProfileViewController()
        
        homeVC.delegate = self
        
        self.navigationController?.pushViewController(homeVC, animated: true)
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("MainViewController's viewWillAppear called")
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("MainViewController's viewDidAppear called")
        
    }
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        print("MainViewController's viewWillDisappear called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("MainViewController's viewDidDisappear called")
    }
    
    
    
    
}



extension MainViewController: DataTransferDelegate{
    func didReceivedData(data: String) {
        delegateChecherButton.configuration?.title = data
    }
}
