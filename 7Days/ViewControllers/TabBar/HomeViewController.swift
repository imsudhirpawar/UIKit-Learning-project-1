    //
    //  HomeViewController.swift
    //  7Days
    //
    //  Created by Sudhir Pawar on 04/09/23.
    //



import UIKit
import WebKit

class HomeViewController: UIViewController, WKNavigationDelegate {
    
    let lbl = UILabel()
    var button = UIButton()
    var uiSwitch = UISwitch()
    var segmentedControl = UISegmentedControl()
    var webView = WKWebView()
    var textField = UITextField()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "HomeViewController"
        
        lbl.text = "Toggle Switch to show/hide WebView"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        button = UIButton(type: .system)
//        button.setTitle("Button", for: .normal)
        button.configuration = .tinted()
        button.configuration?.title = "Button"
        button.addTarget(self, action: #selector(buttonTapAction), for: .touchUpInside)
        button.setImage(UIImage(systemName: "cursorarrow.click.2"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .brown
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 7
        
//            button.configuration = .tinted()
//               button.configuration?.title = "iPhone"
//               button.configuration?.image = UIImage(systemName: "iphone")
//               button.configuration?.imagePadding = 8
//               button.configuration?.baseForegroundColor = .systemBlue
//               button.configuration?.baseBackgroundColor = .systemBlue
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        uiSwitch.setOn(false, animated: true)
        uiSwitch.addTarget(self, action: #selector(updateSwitch), for: .valueChanged)
        uiSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        segmentedControl = UISegmentedControl(items: ["Option 1", "Option 2", "Option 3"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .systemBrown
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        textField.placeholder = "This is textField"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lbl)
        view.addSubview(button)
        view.addSubview(uiSwitch)
        view.addSubview(segmentedControl)
        view.addSubview(webView)
        view.addSubview(textField)
        
        
        addConstraints()
    }
    
    private func addConstraints() {
        let margin: CGFloat = 20
        
        NSLayoutConstraint.activate([
            
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            lbl.topAnchor.constraint(equalTo: button.bottomAnchor, constant: margin),
            lbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            uiSwitch.topAnchor.constraint(equalTo: lbl.bottomAnchor, constant: margin),
            uiSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            segmentedControl.topAnchor.constraint(equalTo: uiSwitch.bottomAnchor, constant: margin),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: margin),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            webView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: margin),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            
           
           
        ])
    }
    
    @objc func updateSwitch() {
        lbl.text = uiSwitch.isOn ? "Toggle Switch to Hide WibView" : "Turn On Switch of Show WebView"
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textColor = .brown
        uiSwitch.onTintColor = .brown
        
        webView.isHidden = !uiSwitch.isOn
        
        
        if let url = URL(string: "https://www.linkedin.com/feed/update/urn:li:activity:7095725308279988225/") {
            let req = URLRequest(url: url)
            webView.load(req)
        }
       
    }
    
    @objc func buttonTapAction() {
        print("Button Tapped...")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("HomeViewController's viewWillAppear called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("HomeViewController's viewDidAppear called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("HomeViewController's viewWillDisappear called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("HomeViewController's viewDidDisappear called")
    }
}
