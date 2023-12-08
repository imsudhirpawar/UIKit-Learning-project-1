    //
    //  LocationViewController.swift
    //  7Days
    //
    //  Created by Sudhir Pawar on 15/09/23.
    //




import UIKit
import GooglePlaces

class LocationViewController: UIViewController {
    
    
    var resultsViewController = GMSAutocompleteResultsViewController()
    var resultView = UITextView()
    var searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController.delegate = self
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController.searchResultsUpdater = resultsViewController
        
        definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = false
        
        let filter = GMSAutocompleteFilter()
        filter.type = .city
        resultsViewController.autocompleteFilter = filter

        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search city"
        navigationItem.searchController = searchController
        
    }
}

extension LocationViewController: GMSAutocompleteResultsViewControllerDelegate {
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didAutocompleteWith place: GMSPlace) {
        
        searchController.isActive = false
        self.dismiss(animated: true, completion: nil)
        print("Place name: \(place.name!)")
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didFailAutocompleteWithError error: Error) {
        print("Error: ", error.localizedDescription)
    }
    
        // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
//        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

