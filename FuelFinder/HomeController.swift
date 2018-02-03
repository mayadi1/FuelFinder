//
//  ViewController.swift
//  FuelFinder
//
//  Created by Hyeongjin Um on 2/3/18.
//  Copyright © 2018 Hyeongjin Um. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    let fuelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Fuel", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(handleFuel), for: .touchUpInside)
        return button
    }()
    
    let electricityButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Electricity", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(handleElectricity), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(fuelButton)
        view.addSubview(electricityButton)
        view.backgroundColor = .white
        
        fuelButton.anchor(top: view.centerYAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: -40, paddingLeft: 40, paddingBottom: 0, paddingRight: -40, width: 0, height: 50)
        
          electricityButton.anchor(top: fuelButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 40, paddingBottom: 0, paddingRight: -40, width: 0, height: 50)
        
        //check if user is already selected fuel
        if UserDefaults.standard.bool(forKey: "isFuel") != nil {
            let mapController = MapController()
            mapController.isFuel = UserDefaults.standard.bool(forKey: "isFuel")
            self.navigationController?.pushViewController(mapController, animated: false)
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    @objc func handleFuel() {
        let mapController = MapController()
        mapController.isFuel = true
        UserDefaults.standard.set(true, forKey: "isFuel")
        self.navigationController?.pushViewController(mapController, animated: true)
    }
    
    @objc func handleElectricity() {
        let mapController = MapController()
        mapController.isFuel = false
        UserDefaults.standard.set(false, forKey: "isFuel")
        self.navigationController?.pushViewController(mapController, animated: true)
    }
    
    

}

