//
//  ViewController.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/16/23.
//

import UIKit
import CoreLocation

protocol ViewController_ViewControllerProtocol: AnyObject {
    func foodTruckResponse(foodTruckResponse: [FoodTruck.Response])
}

class ViewController: BaseViewController, ViewController_ViewControllerProtocol {
    var foodTruckArray = [FoodTruck.Response]()
    var presenter: ViewController_PresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ViewController_Presenter(self)
        presenter?.fatchFoodTrucksData()
        
        setUpNavigationBar()
        setBackgroundImage_Gradient_Light(view: self.view)
        
        //fatchFoodTrucksData()
    }
    func foodTruckResponse(foodTruckResponse: [FoodTruck.Response]) {
        self.foodTruckArray = foodTruckResponse
    }
//    fileprivate func fatchFoodTrucksData() {
//        // get json from url
//        if let url = URL(string: "https://data.sfgov.org/resource/jjew-r69b.json") {
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                if let data = data {
//                    do {
//                        self.foodTruckArray = try JSONDecoder().decode([FoodTruck.Response].self, from: data)
//                        print(self.foodTruckArray)
//                    } catch let error {
//                        print(error)
//                        self.showErrorMessage()
//                    }
//                }
//            }.resume()
//        }
//    }
    
    fileprivate func getCurrentHours() ->Int {
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en-US")
        formatter.dateFormat = "HH a"
        let currentTime = formatter.string(from: date).prefix(2)
        let currentHour = (currentTime as NSString).integerValue
        return currentHour
    }
    
    // launch location list View
    fileprivate func launchLocationListView() {
        let currentHour = getCurrentHours()
        
        var tempFoodTruckArray = [FoodTruckModel]()
        for foodTruck in foodTruckArray {
            let tempStartTime  = (foodTruck.starttime.prefix(1) as NSString).integerValue
            var tempEndTime  = (foodTruck.endtime.prefix(1) as NSString).integerValue
            if foodTruck.endtime.contains("PM") {
                tempEndTime += 12
            }
            if currentHour >= tempStartTime && currentHour < tempEndTime {
                let tempFoodTruck = FoodTruckModel(applicant: foodTruck.applicant,
                                                   location: foodTruck.location,
                                                   startTime: foodTruck.starttime,
                                                   endTime: foodTruck.endtime,
                                                   optionalText: (foodTruck.optionaltext ?? ""),
                                                   latitude: foodTruck.latitude,
                                                   longitude: foodTruck.longitude)
                tempFoodTruckArray.append(tempFoodTruck)
            }
        }
        
        if !tempFoodTruckArray.isEmpty {
            //launch list view location
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "ListView") as? ListViewController
            if let vc = viewController {
                if !tempFoodTruckArray.isEmpty {
                    vc.FoodTrucks = tempFoodTruckArray
                }
                self.navigationController?.show(vc, sender: nil)
            }
        } else {
            showErrorMessage()
        }
    }
    
    fileprivate func showErrorMessage() {
        let alert = UIAlertController(title: "Food Truck", message: "\nNo Food truch avalible, please try again later.",
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onLocationTapped(_ sender: Any) {
        print("User selected: onLocationTapped")
        
        let locationManager = CLLocationManager()
        
        switch locationManager.authorizationStatus {
        case .restricted, .denied:
            let alert = UIAlertController(title: "Location Request", message: nil, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Location Request", style: UIAlertAction.Style.default, handler: { _ in
                // launch Food Truck app settings
                if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(settingsURL, options: [UIApplication.OpenExternalURLOptionsKey: Any](), completionHandler: nil)
                }
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "MapView")
                self.navigationController?.show(viewController, sender: nil)
            }))

            present(alert, animated: true, completion: nil)
        case .authorizedAlways, .authorizedWhenInUse:
            launchLocationListView()
        default:
            print("Need Location Authorization")
        }
    }
    
}

