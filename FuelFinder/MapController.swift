//
//  MapController.swift
//  FuelFinder
//
//  Created by Hyeongjin Um on 2/3/18.
//  Copyright © 2018 Hyeongjin Um. All rights reserved.
//

import UIKit

class MapController: UIViewController {
    
    var isFuel: Bool? {
        didSet{
            updateUI()
        }
    }
    
    
    private func updateUI() {
        print("is fuel: ", isFuel)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
