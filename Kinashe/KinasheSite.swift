//
//  ContactUs.swift
//  Kinashe
//
//  Created by Matthew Daniel Robi on 10/24/19.
//  Copyright © 2019 Emmanuel Daniel Robi. All rights reserved.
//

import Foundation
import UIKit
// View for Contact page
class ContactUs : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar()
        configureViewComponents()
        navigationController?.navigationBar.isHidden = false
      }
    
    func NavBar() {
        view.backgroundColor = .AppDarkBlue()
        navigationController?.navigationBar.barTintColor = UIColor.AppDarkBlue()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .scaleAspectFill
        let image = UIImage(named: "NavigationBar")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    // Company Logo
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "ContactUs")
        return iv
    }()

    // Message to user
    let question: UILabel = {
        let label = UILabel()
        label.text = "Thank you for using Kinashe! \nቅናሽ ስለተጠቀሙ እናመሰግናለን!"
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 2
        label.textAlignment = NSTextAlignment.center
        label.textColor = .white
        return label
    }()

    // Button to website
    let websitebutton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add your business here! \nንግድዎን እዚህ ያክሉ! \nkinashe.com", for: .normal)
        button.titleLabel?.numberOfLines = 3
        button.titleLabel?.textAlignment = NSTextAlignment.center

        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        button.addTarget(self, action: #selector(website), for: .touchUpInside)
        return button
    }()
    
    // function for button to get to website link
    @objc func website() {
         UIApplication.shared.open(URL(string: "https://kinashe.com/")! as URL, options: [:], completionHandler: nil)
      }
    
    // Constraints for screen
    func configureViewComponents() {
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 300)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          
        view.addSubview(question)
        question.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: -20, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 300, height: 75)
        
        view.addSubview(websitebutton)
        websitebutton.anchor(top: question.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 300, height: 50)
          

            
        }
    
}
    
