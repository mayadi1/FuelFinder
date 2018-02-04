//
//  MapController.swift
//  FuelFinder
//
//  Created by Hyeongjin Um on 2/3/18.
//  Copyright © 2018 Hyeongjin Um. All rights reserved.
//

import UIKit
import TomTomOnlineSDKMaps
import TomTomOnlineUtils
import TomTomOnlineSDKRouting
import DropDown

class MapController: UIViewController, UISearchBarDelegate, UITextFieldDelegate {
    
    var searchbarResult = ""
    
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
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        view.addSubview(mapView)
        mapView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(backButton)
        backButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 18, paddingLeft: 2, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        
        view.addSubview(searchBarContainerView)
        searchBarContainerView.anchor(top: backButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: 0, height: 40)
        
        
        view.addSubview(searchbarTextField)
        searchbarTextField.anchor(top: searchBarContainerView.topAnchor, left: searchBarContainerView.leftAnchor, bottom: searchBarContainerView.bottomAnchor, right: searchBarContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        searchbarTextField.delegate = self
    
        dropdownView.backgroundColor = .clear
        
        view.addSubview(dropdownView)
        dropdownView.anchor(top: searchbarTextField.bottomAnchor, left: searchbarTextField.leftAnchor, bottom: searchbarTextField.bottomAnchor, right: searchbarTextField.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        setupDropDown()

    }
    let dropDown = DropDown()
    let dropdownView = UIView()


    func setupDropDown() {
        dropDown.anchorView = dropdownView
        dropDown.backgroundColor = UIColor(white: 1, alpha: 0.5)
        dropDown.shadowColor = .clear
        dropDown.isOpaque = true
        
        dropDown.dataSource = ["Car", "Motorcycle", "Truck"]
        
        
        //*** user selected a item( of drop down cells ) manually.
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                    print("Selected item: \(item) at index: \(index)")
        }
    }
    
    
    
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dropDown.hide()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("begin editing")
        dropDown.show()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        dropDown.show()
        if var currentText = searchbarTextField.text {
            currentText = currentText + string
            searchbarResult = currentText
            print(searchbarResult)
            if currentText.count == 0 {
                searchbarResult = ""
            }
        }
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    
    private func updateUI() {
        print("is fuel: ", isFuel)
    }
    
    @objc func handleBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
  
    
    
}
