//
//  ListViewController.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/17/23.
//

import Foundation
import UIKit

class ListViewController: UIViewController {
    
    // Create inital food truc data
    var FoodTrucks = [FoodTruckModel]()
    
    @IBOutlet weak var FoodTruckTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Set Title
        title = NSLocalizedString("Food Truck", comment: "ListViewController: Set screen header title")
        // Hide back button
        navigationItem.setHidesBackButton(true, animated: true)
        // Show Map button
        createNavigationBarButton()
        // configure TableView
        configureListTableView()
    }

    // Map button at the top right corner on the navigation bar
    func createNavigationBarButton() {
        let mapButton = UIButton(type: .custom)
        mapButton.setImage(UIImage(named: ""), for: .normal)
        mapButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        mapButton.addTarget(self, action: #selector(showMapView), for: .touchUpInside)
        mapButton.accessibilityIdentifier = "NAVIGATION_MAP_BUTTON"
        mapButton.accessibilityLabel = "Map"
        mapButton.setTitleColor(UIColor.blue, for: .normal)
        mapButton.setTitle("Map", for: .normal)
        let navBarButtonItem = UIBarButtonItem(customView: mapButton)
        navigationItem.setRightBarButtonItems([navBarButtonItem], animated: true)
    }
    // Show Map view controller
    @objc
    func showMapView() {
        print("Map button clicked")
        launchLocationMapView()
    }
    
    // launch location map view
    fileprivate func launchLocationMapView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MapView") as? MapViewController
        if let vc = viewController {
            if !FoodTrucks.isEmpty {
                vc.FoodTrucks = FoodTrucks
            }
            self.navigationController?.show(vc, sender: nil)
        }
    }
}

// Extensions for table view Delegate and Data source
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func configureListTableView() {
        //Set delegate and data source
        FoodTruckTableView.delegate = self
        FoodTruckTableView.dataSource = self

        // cell for Food Truck list
        FoodTruckTableView?.register(UINib(nibName: "FoodTruckTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodTruckTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FoodTrucks.count
    }
    
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        120
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "FoodTruckTableViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? FoodTruckTableViewCell {
            let foodTruckDataModel = FoodTrucks[indexPath.row]
            
            // Update view function from foodTruck cell
            cell.updateCellView(foodTruckModel: foodTruckDataModel)
            return cell
        } else {
            return FoodTruckTableViewCell()
        }
    }
}
