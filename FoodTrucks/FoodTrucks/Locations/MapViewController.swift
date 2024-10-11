//
//  MapViewController.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/16/23.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class MapViewController: BaseViewController {

    var FoodTrucks = [FoodTruckModel]()
    
    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocationCoordinate2D?
    private var foodTruckAnnotations: [FoodTruckAnnotation] = []
    
    weak var detailsView: FoodTruckTableViewCell?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        // Show artwork on map
        updateMapData()
        
        // Set Title
        title = NSLocalizedString("Food Truck", comment: "MapViewController: Set screen header title")
        
        setUpNavigationBar()
        setBackgroundImage_Gradient_Light(view: self.view)
        
        //Show Map button
        createNavigationBarButton()
        
        // Set initial location in San Francisco
        let initialLocation = CLLocation(latitude: 37.773972, longitude: -122.431297)
        mapView.centerToLocation(initialLocation)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        detailsView = nil
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if detailsView != nil {
            detailsView?.removeFromSuperview()
        }
    }

    // Show the pin for data source
    private func updateMapData() {
        for foodTruck in FoodTrucks {
            let latitude = (foodTruck.latitude as NSString).doubleValue
            let longitude = (foodTruck.longitude as NSString).doubleValue
            let foodTruckAnnotation = FoodTruckAnnotation(title: foodTruck.applicant, 
                                                          subtitle: foodTruck.applicant,
                                                          coordinate: CLLocationCoordinate2D(latitude: latitude, 
                                                                                             longitude: longitude),
                                                          locationName: foodTruck.location,
                                                          foodTruck: foodTruck)
            foodTruckAnnotations.append(foodTruckAnnotation)
        }
        mapView.addAnnotations(foodTruckAnnotations)
    }
    
    // List button at the top right corner on the navigation bar
    fileprivate func createNavigationBarButton() {
        let mapButton = UIButton(type: .custom)
        mapButton.setImage(UIImage(named: ""), for: .normal)
        mapButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        mapButton.addTarget(self, action: #selector(showMapView), for: .touchUpInside)
        mapButton.accessibilityIdentifier = "NAVIGATION_List_BUTTON"
        mapButton.accessibilityLabel = "List"
        mapButton.setTitleColor(UIColor.blue, for: .normal)
        mapButton.setTitle("List", for: .normal)
        let navBarButtonItem = UIBarButtonItem(customView: mapButton)
        navigationItem.setRightBarButtonItems([navBarButtonItem], animated: true)
    }
    
    // Show List view controller
    @objc
    func showMapView() {
        print("List button clicked")
        launchLocationListView()
    }
    
    // launch location List view
    fileprivate func launchLocationListView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Location Service autorization
    private func configureLocationServices() {
        locationManager.delegate = self
        //mapView.delegate = self
        
        switch locationManager.authorizationStatus {
        case .restricted, .denied:
            locationManager.requestAlwaysAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            beginLocationUpdates(locationManager: locationManager)
        default:
            print("Need Location Authorization")
        }
    }
    
    private func beginLocationUpdates(locationManager: CLLocationManager) {
        mapView.showsUserLocation = true
        mapView.mapType = MKMapType.standard
        mapView.showsTraffic = true
        mapView.showAnnotations(mapView.annotations, animated: true)
        mapView.register(MKMarkerAnnotationView.self, 
                         forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
}

// Location delegate
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Update Locations")

        guard let latestLocation = locations.first else { return }
        if currentLocation == nil {
            let zoomRegion = MKCoordinateRegion(center: latestLocation.coordinate, latitudinalMeters: 10, longitudinalMeters: 10)
            mapView.setRegion(zoomRegion, animated: true)
        }
        currentLocation = latestLocation.coordinate
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Change Locations")
        if status == .authorizedAlways || status == .authorizedWhenInUse {
           beginLocationUpdates(locationManager: manager)
       }
    }
}

// Map delegate
extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        print("Pin clicked");
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Pin selected");
        if let pin = view.annotation as? FoodTruckAnnotation {
            let frame = CGRect(x: 0, y: mapView.frame.height - 130, width: mapView.frame.width, height: 130)

            if detailsView != nil {
                detailsView?.removeFromSuperview()
            }

            if let detailsView = Bundle.main.loadNibNamed("FoodTruckTableViewCell", 
                                                          owner: self,
                                                          options: nil)?.first as? FoodTruckTableViewCell {
                self.detailsView = detailsView
                mapView.addSubview(detailsView)
                detailsView.frame = frame
                detailsView.backgroundColor = .white
                updateDetailsView(pin, detailsView)
            }
        }
    }
    
    fileprivate func updateDetailsView(_ pin: FoodTruckAnnotation, _ detailsView: FoodTruckTableViewCell) {
        if let foodTruck = pin.foodTruck {
            detailsView.updateCellView(foodTruckModel: foodTruck)
        }
    }
}

// MapView extension
private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
