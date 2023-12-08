//
//  TestViewController.swift
//  7Days
//
//  Created by Sudhir Pawar on 04/09/23.
//

import UIKit
import WebKit

class TestViewController: UIViewController {
    
    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "http://127.0.0.1:5000/") {
            let req = URLRequest(url: url)
            webView.load(req)
        }
        webView.translatesAutoresizingMaskIntoConstraints  = false
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
        
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
}
