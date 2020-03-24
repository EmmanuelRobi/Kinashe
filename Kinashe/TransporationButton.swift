//
//  TransporationButton.swift
//  Kinashe
//
//  Created by Matthew Daniel Robi on 10/24/19.
//  Copyright © 2019 Emmanuel Daniel Robi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage


// Comments are the same as "Location" document
class TransportationController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar()
        view.addSubview(scrollView)
        setupScrollView()
        configureViewComponents()
    }
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.contentSize.height = 400
         view.backgroundColor = UIColor.AppDarkBlue()
        return view
     }()
    
    func setupScrollView(){
          
          scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
          scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func NavBar() {
        self.navigationItem.title = "Transportation | መጓጓዣ"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        view.backgroundColor = .AppDarkBlue()
        navigationController?.navigationBar.barTintColor = UIColor.AppDarkBlue()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
    }
    
    let Air_Travel_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "EthiopianAirlines"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Air_Travel_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Air_Travel_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Air Travel | የአየር ጉዞ"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(13)
        return label
    }()
    
    
    @objc func Air_Travel_Result() {
        navigationController?.pushViewController(Air_Travel_Controller(), animated: true)
    }

    let Car_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "CarRental"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Car_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Car_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Car Rental | የመኪና ኪራይ"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(13)
        return label
    }()
    
    
    @objc func Car_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Car Rental | የመኪና ኪራይ"
        myVC.Business_Type = "Car Rental"
        myVC.Photo_Name = "CarRental"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Gas_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Gas"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Gas_Handler), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Gas_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        label.text = "Gas | ነዳጅ ማደያ"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(13)
        return label
    }()

     @objc func Gas_Handler() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Gas | ነዳጅ ማደያ"
        myVC.Business_Type = "Gas"
        myVC.Photo_Name = "Gas"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
     let Taxi_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "taxi"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Taxi_Handler), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Taxi_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Taxi | ታክሲ"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(13)
        return label
    }()
    
    @objc func Taxi_Handler() {
         let myVC = PromoOrAllLayout()
         myVC.Nav_Bar_Name = "Taxi | ታክሲ"
         myVC.Business_Type = "Taxi"
         myVC.Photo_Name = "taxi"
         navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Train_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "train"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Train_Handler), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Train_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Train | ባቡር"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(13)
        return label

    }()
    
     @objc func Train_Handler() {
         let myVC = PromoOrAllLayout()
         myVC.Nav_Bar_Name = "Train | ባቡር"
         myVC.Business_Type = "Train"
         myVC.Photo_Name = "train"
         navigationController?.pushViewController(myVC, animated: true)
    }
    
    func configureViewComponents() {
           let screen = UIScreen.main.bounds
           let screenWidth = screen.width
           let screenHeight = screen.height

          scrollView.addSubview(Air_Travel_Button)
          Air_Travel_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
          Air_Travel_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          
          scrollView.addSubview(Air_Travel_Label)
          Air_Travel_Label.anchor(top: nil, left: view.leftAnchor, bottom: Air_Travel_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
          Air_Travel_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          
          scrollView.addSubview(Car_Button)
          Car_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
          Car_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          
          scrollView.addSubview(Car_Label)
          Car_Label.anchor(top: nil, left: view.leftAnchor, bottom: Car_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
          Car_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          
          scrollView.addSubview(Gas_Button)
          Gas_Button.anchor(top: (Air_Travel_Button).topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
          Gas_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          
          scrollView.addSubview(Gas_Label)
          Gas_Label.anchor(top: nil, left: view.leftAnchor, bottom: Gas_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
          Gas_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          
          scrollView.addSubview(Taxi_Button)
          Taxi_Button.anchor(top: Car_Button.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
          Taxi_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          
          scrollView.addSubview(Taxi_Label)
          Taxi_Label.anchor(top: nil, left: view.leftAnchor, bottom: Taxi_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
          Taxi_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    
        scrollView.addSubview(Train_Button)
        Train_Button.anchor(top: (Gas_Button).topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
        Train_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        scrollView.addSubview(Train_Label)
        Train_Label.anchor(top: nil, left: view.leftAnchor, bottom: Train_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
        Train_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
}
}

class Air_Travel_Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar()
        view.addSubview(scrollView)
        setupScrollView()
        configureViewComponents()
    }
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.contentSize.height = 400
         view.backgroundColor = UIColor.AppDarkBlue()
        return view
     }()
    
    func setupScrollView(){
          
          scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
          scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func NavBar() {
        self.navigationItem.title = "Air Travel | የአየር ጉዞ"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        view.backgroundColor = .AppDarkBlue()
        navigationController?.navigationBar.barTintColor = UIColor.AppDarkBlue()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
    }

    let Airport_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "EthiopianAirlines"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Airport_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Airport_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Airport | አየር ማረፊያ"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(13)
        return label
    }()
    
    
    @objc func Airport_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Airport | አየር ማረፊያ"
        myVC.Business_Type = "Airport"
        myVC.Photo_Name = "EthiopianAirlines"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Travel_Agent_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "TravelAgent"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Travel_Agent_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Travel_Agent_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Travel Agent | የጉዞ ወኪል"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(13)
        return label
    }()

     @objc func Travel_Agent_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Travel Agent | የጉዞ ወኪል"
        myVC.Business_Type = "Travel Agency"
        myVC.Photo_Name = "TravelAgent"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    func configureViewComponents() {
           let screen = UIScreen.main.bounds
           let screenWidth = screen.width
           let screenHeight = screen.height

          scrollView.addSubview(Airport_Button)
          Airport_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
          Airport_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          
          scrollView.addSubview(Airport_Label)
          Airport_Label.anchor(top: nil, left: view.leftAnchor, bottom: Airport_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
          Airport_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          
          scrollView.addSubview(Travel_Agent_Button)
          Travel_Agent_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
          Travel_Agent_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          
          scrollView.addSubview(Travel_Agent_Label)
          Travel_Agent_Label.anchor(top: nil, left: view.leftAnchor, bottom: Travel_Agent_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
          Travel_Agent_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          
}
}





