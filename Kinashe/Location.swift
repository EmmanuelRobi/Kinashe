//
//  Location.swift
//  Kinashe
//
//  Created by Matthew Daniel Robi on 10/24/19.
//  Copyright © 2019 Emmanuel Daniel Robi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import CoreLocation


class Location: UIViewController, CLLocationManagerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar()
        view.addSubview(scrollView)
        setupScrollView()
        configureViewComponents()
    }

    // Added minimum scroll of 645 so all apple devices should be able to see all buttons
    lazy var scrollView: UIScrollView = {
       let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize.height = 645
        view.backgroundColor = UIColor.AppDarkBlue()
        
        return view
    }()

    // Constraints for scroll view that hold images
    func setupScrollView(){
          scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
          scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    // set up for navigation bar
    func NavBar() {
        self.navigationItem.title = "Place | ቦታ"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        //view.backgroundColor = .backgroundgray()
        view.backgroundColor = .AppDarkBlue()
        navigationController?.navigationBar.barTintColor = UIColor.AppDarkBlue()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
    }

     // Creating Button for Bank
      let Bank_Button: UIButton = {
          let button = UIButton()
          button.contentMode = .center
          button.setImage(#imageLiteral(resourceName: "Bank"), for: UIControl.State.normal)
          button.addTarget(self, action: #selector(Bank_Handler), for: .touchUpInside)
          button.imageView!.layer.cornerRadius = 5
          button.backgroundColor = .white
          button.layer.cornerRadius = 5
          return  button
      }()
      // Creating label for bank
      let Bank_Label: UILabel = {
          let label = UILabel()
          label.textAlignment = NSTextAlignment.center
          label.text = "Bank | ባንክ"
          label.shadowColor = .black
          label.shadowOffset = CGSize(width: 0, height: -1)
          label.textColor = .white
          label.font = label.font.withSize(13)
          return label
      }()
    // after user presses the bank button, user will be snt to promo or all layout controller
      @objc func Bank_Handler() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Bank | ባንክ"
        myVC.Business_Type = "Bank"
        myVC.Photo_Name = "Bank"
        navigationController?.pushViewController(myVC, animated: true)
    }
      
      let Coffee_Button: UIButton = {
          let button = UIButton()
          button.contentMode = .center
          button.setImage(#imageLiteral(resourceName: "Coffee"), for: UIControl.State.normal)
          button.addTarget(self, action: #selector(Coffee_Handler), for: .touchUpInside)
          button.imageView!.layer.cornerRadius = 5
          button.backgroundColor = .white
          button.layer.cornerRadius = 5
          return  button
      }()
      
      let Coffee_Label: UILabel = {
          let label = UILabel()
          label.textAlignment = NSTextAlignment.center
          label.text = "Cafe | ካፌ"
          label.shadowColor = .black
          label.shadowOffset = CGSize(width: 0, height: -1)
          label.textColor = .white
          label.font = label.font.withSize(13)
          return label
      }()
      
      @objc func Coffee_Handler() {
          let myVC = PromoOrAllLayout()
          myVC.Nav_Bar_Name = "Cafe | ካፌ"
          myVC.Business_Type = "Cafe"
          myVC.Photo_Name = "Coffee"
          navigationController?.pushViewController(myVC, animated: true)
    }

      
      let Entertainment_Button: UIButton = {
             let button = UIButton()
             button.contentMode = .center
             button.setImage(#imageLiteral(resourceName: "Entertainment"), for: UIControl.State.normal)
             button.addTarget(self, action: #selector(Entertainment_Handler), for: .touchUpInside)
             button.imageView!.layer.cornerRadius = 5
             button.backgroundColor = .white
             button.layer.cornerRadius = 5
             return  button
         }()
         
         let Entertainment_Label: UILabel = {
             let label = UILabel()
             label.textAlignment = NSTextAlignment.center
             label.text = "Entertainment | መዝናኛ"
             label.shadowColor = .black
             label.shadowOffset = CGSize(width: 0, height: -1)
             label.textColor = .white
             label.font = label.font.withSize(13)
             return label

         }()
      
       @objc func Entertainment_Handler() {
           navigationController?.pushViewController(Entertainment_Controller(), animated: true)
       }

      
      let Fitness_And_Health_Button: UIButton = {
          let button = UIButton()
          button.contentMode = .center
          button.setImage(#imageLiteral(resourceName: "Gym"), for: UIControl.State.normal)
          button.addTarget(self, action: #selector(Fitness_And_Health_Handler), for: .touchUpInside)
          button.imageView!.layer.cornerRadius = 5
          button.backgroundColor = .white
          button.layer.cornerRadius = 5
          return  button

      }()
      
      let Fitness_And_Health_Label: UILabel = {
          let label = UILabel()
          label.textAlignment = NSTextAlignment.center
          label.text = "Fitness and Health | የእስፓርት ማዕከሎች"
          label.shadowColor = .black
          label.shadowOffset = CGSize(width: 0, height: -1)
          label.textColor = .white
          label.font = label.font.withSize(10)
          label.numberOfLines = 2
          return label

      }()

      @objc func Fitness_And_Health_Handler() {
          let myVC = PromoOrAllLayout()
          myVC.Nav_Bar_Name = "Fitness and Health | የእስፓርት ማዕከሎች"
          myVC.Business_Type = "Fitness and Health"
          myVC.Photo_Name = "Gym"
          navigationController?.pushViewController(myVC, animated: true)
    }
    
    
    let Food_Button: UIButton = {
              let button = UIButton()
              button.contentMode = .center
              button.setImage(#imageLiteral(resourceName: "Food"), for: UIControl.State.normal)
              button.addTarget(self, action: #selector(Food_Handler), for: .touchUpInside)
              button.imageView!.layer.cornerRadius = 5
              button.backgroundColor = .white
              button.layer.cornerRadius = 5
              return  button
          }()
          
          let Food_Label: UILabel = {
              let label = UILabel()
              label.textAlignment = NSTextAlignment.center
              label.text = "Food | ምግብ "
              label.shadowColor = .black
              label.shadowOffset = CGSize(width: 0, height: -1)
              label.textColor = .white
              label.font = label.font.withSize(13)
              return label
          }()
    
    @objc func Food_Handler() {
        navigationController?.pushViewController(Food_Controller(), animated: true)
    }
      
          let Hair_Salon_Spa_Button: UIButton = {
                let button = UIButton()
                button.contentMode = .center
                button.setImage(#imageLiteral(resourceName: "Spa"), for: UIControl.State.normal)
                button.addTarget(self, action: #selector(Hair_Salon_Spa_Handler), for: .touchUpInside)
                button.imageView!.layer.cornerRadius = 5
                button.backgroundColor = .white
                button.layer.cornerRadius = 5
                return  button
            }()
            
            let Hair_Salon_Spa_Label: UILabel = {
                let label = UILabel()
                label.textAlignment = NSTextAlignment.center
                label.text = "Hair, Salon and Spa | የውበት ሳሎን እና ስፓ"
                label.shadowColor = .black
                label.shadowOffset = CGSize(width: 0, height: -1)
                label.textColor = .white
                label.font = label.font.withSize(10)
                label.numberOfLines = 2
                return label

            }()

      
      @objc func Hair_Salon_Spa_Handler() {
          navigationController?.pushViewController(Hair_Salon_Spa_Controller(), animated: true)
      }

        let Loding_Button: UIButton = {
                 let button = UIButton()
                 button.contentMode = .center
                 button.setImage(#imageLiteral(resourceName: "GuestHouse"), for: UIControl.State.normal)
                 button.addTarget(self, action: #selector(Lodging_Handler), for: .touchUpInside)
                 button.imageView!.layer.cornerRadius = 5
                 button.backgroundColor = .white
                 button.layer.cornerRadius = 5
                 return  button
             }()
             
             let Loding_Label: UILabel = {
                 let label = UILabel()
                 label.textAlignment = NSTextAlignment.center
                 label.text = "Lodging | የማረፍያ ቦታ"
                 label.shadowColor = .black
                 label.shadowOffset = CGSize(width: 0, height: -1)
                 label.textColor = .white
                 label.font = label.font.withSize(13)
                 return label
             }()
        
        @objc func Lodging_Handler() {
            navigationController?.pushViewController(Lodging_Controller(), animated: true)
        }
      
      let Major_Attraction_Button: UIButton = {
          let button = UIButton()
          button.contentMode = .center
          button.setImage(#imageLiteral(resourceName: "Sightseeing"), for: UIControl.State.normal)
          button.addTarget(self, action: #selector(Major_Attraction_Handler), for: .touchUpInside)
          button.imageView!.layer.cornerRadius = 5
          button.backgroundColor = .white
          button.layer.cornerRadius = 5
          return  button

      }()
      
      let Major_Attraction_Label: UILabel = {
          let label = UILabel()
          label.textAlignment = NSTextAlignment.center
          label.text = "Major Attractions | ዋና መስህብ"
          label.shadowColor = .black
          label.shadowOffset = CGSize(width: 0, height: -1)
          label.textColor = .white
          label.font = label.font.withSize(10)
          label.numberOfLines = 2
          return label
      }()
          
      @objc func Major_Attraction_Handler() {
          navigationController?.pushViewController(Major_Attraction_Controller(), animated: true)
      }

    
    let Shopping_Button: UIButton = {
           let button = UIButton()
           button.contentMode = .center
           button.setImage(#imageLiteral(resourceName: "Clothstore"), for: UIControl.State.normal)
           button.addTarget(self, action: #selector(Shopping_Handler), for: .touchUpInside)
           button.imageView!.layer.cornerRadius = 5
           button.backgroundColor = .white
           button.layer.cornerRadius = 5
           return  button
       }()
       
       let Shopping_Label: UILabel = {
           let label = UILabel()
           label.textAlignment = NSTextAlignment.center
           label.text = "Shopping | ግብይት"
           label.shadowColor = .black
           label.shadowOffset = CGSize(width: 0, height: -1)
           label.textColor = .white
           label.font = label.font.withSize(13)
           return label
       }()
    
    @objc func Shopping_Handler() {
        navigationController?.pushViewController(Shopping_Controller(), animated: true)
    }
    
    let Medical_Button: UIButton = {
           let button = UIButton()
           button.contentMode = .center
           button.setImage(#imageLiteral(resourceName: "Hospital"), for: UIControl.State.normal)
           button.addTarget(self, action: #selector(Medical_Handler), for: .touchUpInside)
           button.imageView!.layer.cornerRadius = 5
           button.backgroundColor = .white
           button.layer.cornerRadius = 5
           return  button
       }()
       
       let Medical_Label: UILabel = {
           let label = UILabel()
           label.textAlignment = NSTextAlignment.center
           label.text = "Medical | ሕክምና"
           label.shadowColor = .black
           label.shadowOffset = CGSize(width: 0, height: -1)
           label.textColor = .white
           label.font = label.font.withSize(13)
           return label
       }()
    
    @objc func Medical_Handler() {
        navigationController?.pushViewController(Medical_Controller(), animated: true)
    }
    
    
    let Other_Button: UIButton = {
           let button = UIButton()
           button.contentMode = .center
           button.setImage(#imageLiteral(resourceName: "Splash Screen"), for: UIControl.State.normal)
           button.addTarget(self, action: #selector(Other_Handler), for: .touchUpInside)
           button.imageView!.layer.cornerRadius = 5
           button.backgroundColor = .white
           button.layer.cornerRadius = 5
           return  button
       }()
       
       let Other_Label: UILabel = {
           let label = UILabel()
           label.textAlignment = NSTextAlignment.center
           label.text = "Other | ቀሪ ነገሮች"
           label.shadowColor = .black
           label.shadowOffset = CGSize(width: 0, height: -1)
           label.textColor = .white
           label.font = label.font.withSize(13)
           return label
       }()
    
    @objc func Other_Handler() {
        navigationController?.pushViewController(Other_Controller(), animated: true)
    }
    // Adding constraints for all the buttons 
    func configureViewComponents(){
        let screen = UIScreen.main.bounds
        let screenWidth = screen.width
                scrollView.addSubview(Bank_Button)
                Bank_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
                Bank_Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
               
                scrollView.addSubview(Bank_Label)
                Bank_Label.anchor(top: nil, left: view.leftAnchor, bottom: Bank_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
                Bank_Label.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
                
                scrollView.addSubview(Coffee_Button)
                Coffee_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
                Coffee_Button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
               
                scrollView.addSubview(Coffee_Label)
                Coffee_Label.anchor(top: nil, left: view.leftAnchor, bottom: Coffee_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
                Coffee_Label.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
               scrollView.addSubview(Entertainment_Button)
               Entertainment_Button.anchor(top: (Bank_Button).topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
               Entertainment_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               
               scrollView.addSubview(Entertainment_Label)
               Entertainment_Label.anchor(top: nil, left: view.leftAnchor, bottom: Entertainment_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
               Entertainment_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               //
               scrollView.addSubview(Fitness_And_Health_Button)
               Fitness_And_Health_Button.anchor(top: Coffee_Button.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
               Fitness_And_Health_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               
               scrollView.addSubview(Fitness_And_Health_Label)
               Fitness_And_Health_Label.anchor(top: nil, left: view.leftAnchor, bottom: Fitness_And_Health_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
               Fitness_And_Health_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               
               scrollView.addSubview(Food_Button)
               Food_Button.anchor(top: (Entertainment_Button).topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
               Food_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               
               scrollView.addSubview(Food_Label)
               Food_Label.anchor(top: nil, left: view.leftAnchor, bottom: Food_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
               Food_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               
               scrollView.addSubview(Hair_Salon_Spa_Button)
               Hair_Salon_Spa_Button.anchor(top: Fitness_And_Health_Button.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
               Hair_Salon_Spa_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               
               scrollView.addSubview(Hair_Salon_Spa_Label)
               Hair_Salon_Spa_Label.anchor(top: nil, left: view.leftAnchor, bottom: Hair_Salon_Spa_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
               Hair_Salon_Spa_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               
               scrollView.addSubview(Loding_Button)
               Loding_Button.anchor(top: (Food_Button).topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
               Loding_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               
               scrollView.addSubview(Loding_Label)
               Loding_Label.anchor(top: nil, left: view.leftAnchor, bottom: Loding_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
               Loding_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               
               scrollView.addSubview(Major_Attraction_Button)
               Major_Attraction_Button.anchor(top: Hair_Salon_Spa_Button.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
               Major_Attraction_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               
               scrollView.addSubview(Major_Attraction_Label)
               Major_Attraction_Label.anchor(top: nil, left: view.leftAnchor, bottom: Major_Attraction_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
               Major_Attraction_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
               scrollView.addSubview(Medical_Button)
               Medical_Button.anchor(top: (Loding_Button).topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
               Medical_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
               scrollView.addSubview(Medical_Label)
               Medical_Label.anchor(top: nil, left: view.leftAnchor, bottom: Medical_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
               Medical_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               
               scrollView.addSubview(Shopping_Button)
               Shopping_Button.anchor(top: Major_Attraction_Button.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
               Shopping_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               
               scrollView.addSubview(Shopping_Label)
               Shopping_Label.anchor(top: nil, left: view.leftAnchor, bottom: Shopping_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
               Shopping_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               
               scrollView.addSubview(Other_Button)
               Other_Button.anchor(top: (Medical_Button).topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
               Other_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               
               scrollView.addSubview(Other_Label)
               Other_Label.anchor(top: nil, left: view.leftAnchor, bottom: Other_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
               Other_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }


}


