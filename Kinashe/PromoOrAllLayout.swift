//
//  PromoOrAllLayout.swift
//  Kinashe
//
//  Created by Matthew Daniel Robi on 3/14/20.
//  Copyright © 2020 Emmanuel Daniel Robi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class PromoOrAllLayout: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar()
        view.addSubview(scrollView)
        setupScrollView()
        configureViewComponents()
    }
    
    // Title of navigation bar
    var Nav_Bar_Name = ""
    // Name of Photo File
    var Photo_Name = ""
    // Name of business type
    var Business_Type = ""
    
    func NavBar() {
        self.navigationItem.title = "\(Nav_Bar_Name)"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        view.backgroundColor = .AppDarkBlue()
        navigationController?.navigationBar.barTintColor = UIColor.AppDarkBlue()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
    }
    
    lazy var scrollView: UIScrollView = {
       let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize.height = 400
        view.backgroundColor = UIColor.AppDarkBlue()
        
        return view
    }()
    
    // Add Constraints for scrollView
    func setupScrollView(){
          scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
          scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    // Add Nearby Button
    let Promo: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Nearby \r\n በአቅራቢያ", for: .normal)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = NSTextAlignment.center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.orange
        button.addTarget(self, action: #selector(Show_Nearby_Result), for: .touchUpInside)
        button.setTitleColor(.AppBlue(), for: .normal)

        return button
    }()
    
    // Navigate to view that creates nearby cells by business type
    @objc func Show_Nearby_Result() {
        let myVC = Nearby_Business_type() 
        myVC.Business_Type_Text = Business_Type
        myVC.Business_Nav_Bar_Text = Nav_Bar_Name
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    //Add All button
    let All: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("All \r\n ሁሉም", for: .normal)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = NSTextAlignment.center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.layer.cornerRadius = 10
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.orange
        button.addTarget(self, action: #selector(Show_All_Result), for: .touchUpInside)
        button.setTitleColor(.AppBlue(), for: .normal)

        return button
    }()
    
    // Navigate to view that creates all cell by business type
    @objc func Show_All_Result() {
        let myVC = All_Business_type()
        myVC.Business_Type_Text = Business_Type
        myVC.Business_Nav_Bar_Text = Nav_Bar_Name
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    //Adds photo from photo Name
    lazy var Picture: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "\(Photo_Name)")
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    //Constraints of screen
    let screen = UIScreen.main.bounds.width
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    //Constraints
        func configureViewComponents() {
            scrollView.addSubview(Picture)
            Picture.anchor(top: scrollView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: screenWidth, height: screenHeight / 3.5
            )
              Picture.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            scrollView.addSubview(Promo)
            Promo.anchor(top: Picture.bottomAnchor, left:  view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 300, height: 150)
            Promo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            scrollView.addSubview(All)
            All.anchor(top: Promo.bottomAnchor, left:  view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 300, height: 150)
            All.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
    }
