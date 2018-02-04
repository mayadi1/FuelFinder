//
//  MapController.swift
//  FuelFinder
//
//  Created by Hyeongjin Um on 2/3/18.
//  Copyright © 2018 Hyeongjin Um. All rights reserved.
//

import UIKit
import TomTomOnlineSDKMaps
import TomTomOnlineSDKRouting

class MapController: UIViewController, UISearchBarDelegate, CLLocationManagerDelegate, TTMapViewDelegate {
    
    let locationManager = CLLocationManager()
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "backbutton"), for: .normal)
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return button
    }()
    
    var isFuel: Bool? {
        didSet{
            updateUI()
        }
    }
    
    let searchBarContainerView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let searchbarTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Where to go?"
        return tf
    }()
    
    let mapView: TTMapView = {
        let view = TTMapView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLocationManager()
        setUpMapView()
        
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        view.addSubview(mapView)
        mapView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(backButton)
        backButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 18, paddingLeft: 2, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        
        view.addSubview(searchBarContainerView)
        searchBarContainerView.anchor(top: backButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: 0, height: 40)
        
        view.addSubview(searchbarTextField)
        searchbarTextField.anchor(top: searchBarContainerView.topAnchor, left: searchBarContainerView.leftAnchor, bottom: searchBarContainerView.bottomAnchor, right: searchBarContainerView.rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
    }
    
    func setUpMapView(){
        
        mapView.center(on: (locationManager.location?.coordinate)!, withZoom: 12)
        mapView.delegate = self
        mapView.isShowsUserLocation = true
        
    }
    
    func setUpLocationManager() {
        
        self.locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone;
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
        
    }
    
    private func updateUI() {
        print("is fuel: ", isFuel!)
    }
    
    @objc func handleBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        print(location)
    }
    
    func performAutocompleteSearch(withQuery query: String) {
        
        
    }
    
    
}

