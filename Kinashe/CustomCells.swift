//
//  CustomCells.swift
//  Kinashe
//
//  Created by Matthew Daniel Robi on 10/24/19.
//  Copyright © 2019 Emmanuel Daniel Robi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import CoreLocation
import MapKit

class CustomTableViewCell: UITableViewCell, CLLocationManagerDelegate, UITableViewDelegate {
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            locationManager.startUpdatingLocation()
        }
        
        addSubview(backView)
        configureViewComponents()



        if selected {
            backView.backgroundColor = UIColor.AppDarkBlue()
        } else {
            backView.backgroundColor = UIColor.AppDarkBlue()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
    }
        
    
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.AppDarkBlue()
        backView.clipsToBounds = true
        CompanyPicture.clipsToBounds = true
        self.CompanyPicture.sd_setImage(with: URL(string: "\(HomePagePhoto)"), completed: nil)

    }
    
    var phoneNumber: String = ""
    var CompanyDesc: String = ""
    var CompanyWebsite: String = ""
    var CompanySchedule: String = ""
    var CompanyNamer: String = ""
    var CompanyDirectionLink: String = ""
    var CompanyDeal: String = ""
    var Lat: CLLocationDegrees = 0.0
    var Lon: CLLocationDegrees = 0.0
    var pictureArrayholder: NSArray = [/*"https://firebasestorage.googleapis.com/v0/b/kinashe-c6bc6.appspot.com/o/V7i2Ad0trsMyfA1BNL0uacceUi13%2F549B18F3-34D7-4D61-8641-88E60C7278A7.JPG?alt=media&token=4447dadb-173a-4245-8692-f7f16ea280ac", "https://firebasestorage.googleapis.com/v0/b/kinashe-c6bc6.appspot.com/o/VsMZC5UMrhR4Fy6OOvqb2q9KzP83%2FCoffee3.png?alt=media&token=6f71f1d7-9011-49cf-bc53-ca6f2364ea36"*/]
    var HomePagePhoto: String = ""
    
    
    
    var locationManager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        let updatelat = locValue.latitude
        let updatelon = locValue.longitude
        let coordinate₀ = CLLocation(latitude: Lat, longitude: Lon)
        let coordinate₁ = CLLocation(latitude: updatelat, longitude: updatelon)
        let distanceInMeters = coordinate₀.distance(from: coordinate₁)
        let convert = distanceInMeters / 1000
        let rounder = Double(convert).rounded()
        self.actualdistancelbl.text = String("\(rounder) km")
        }

    let screen = UIScreen.main.bounds.width
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    lazy var logoImageView: UIImageView = {
        let iv = UIImageView()//frame: CGRect(x: 185, y: 250, width: 200, height: 120))
      //  iv.contentMode = .scaleAspectFill
        iv.contentMode = .scaleAspectFit

        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "CheckItOut")
        return iv
    }()
    
    
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.screenWidth, height: 400))
        return view
    }()

    
    @objc func picturefinder() {
        let site = HomePagePhoto
        self.CompanyPicture.sd_setImage(with: URL(string: "\(site)"), completed: nil)
    }
    
    
    lazy var CompanyPicture: UIImageView = {
        let CompanyPicture = UIImageView()//frame: CGRect(x: 0, y: 0, width: self.screenWidth, height: 250))
        CompanyPicture.backgroundColor = UIColor.lightGray
        print("Testing thhe phonenumber" ,phoneNumber)//, pictureArrayholder.object(at: 0) )
        let testing = pictureArrayholder
        return CompanyPicture
    }()
    

    lazy var CompanyPicture2: UIImageView = {
        let CompanyPicture2 = UIImageView(frame: CGRect(x: 200, y: 4, width: 150, height: 100))
        CompanyPicture2.contentMode = .scaleAspectFill
        CompanyPicture2.backgroundColor = UIColor.clear
        CompanyPicture2.layer.borderWidth = 3
        CompanyPicture2.layer.borderColor = UIColor.white.cgColor
        return CompanyPicture2
    }()
    
    lazy var CompanyName: UILabel = {
        let lbl = UILabel()//frame: CGRect(x: 5, y: 260, width: 200, height: 50))
        lbl.numberOfLines = 3
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textColor = UIColor.white
        return lbl
    }()
    
    lazy var CompanyType: UILabel = {
        let lbl = UILabel()//frame: CGRect(x: 5, y: 312, width: 200, height: 30))
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 10)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textColor = UIColor.white
        lbl.numberOfLines = 1
        return lbl
    }()
    
    lazy var CompanyDescription: UILabel = {
        let lbl = UILabel()//frame: CGRect(x: 5, y: 8, width: 130, height: 30))
        lbl.textAlignment = .left
        lbl.numberOfLines = 3
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textColor = UIColor.white
        lbl.text = CompanyDesc
        return lbl
    }()
    
    lazy var distancelbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 120, y: 330, width: 75, height: 10))
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 10)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textColor = UIColor.white
        return lbl
    }()
    
    lazy var actualdistancelbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 5, y: 344, width: 200, height: 30))
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 10)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textColor = UIColor.white
        lbl.numberOfLines = 1
        return lbl
    }()
    
    lazy var directionbutt: UIButton = {
        let btn = UIButton()//frame: CGRect(x: 220, y: 350, width: 25, height: 35))
        btn.imageEdgeInsets = UIEdgeInsets(top: 60, left: 60, bottom: 60, right: 50)
        btn.setImage(#imageLiteral(resourceName: "Navigation"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(direction), for: .touchUpInside)
        return btn
    }()
    
    @objc func direction() {
         let site = CompanyDirectionLink
        UIApplication.shared.open(URL(string: "https://www.google.com/maps/search/?api=1&query=\(Lat),\(Lon)")! as URL, options: [:], completionHandler: nil)
     }
        
    lazy var phonebutt: UIButton = {
        let btn = UIButton()//frame: CGRect(x: 260, y: 350, width: 25, height: 35))
        btn.imageEdgeInsets = UIEdgeInsets(top: 60, left: 60, bottom: 60, right: 50)
        btn.setImage(#imageLiteral(resourceName: "Phone"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(caller), for: .touchUpInside)
        return btn
    }()
    
    @objc func caller() {
        let number = phoneNumber
        print("Testing thhe phonenumber" ,phoneNumber, pictureArrayholder.object(at: 0) )
        if let url = URL(string: "tel://\(number)") {
            UIApplication.shared.openURL(url)
        }
    }
    
    lazy var websitebutt: UIButton = {
        let btn = UIButton()//frame: CGRect(x: 300, y: 350, width: 35, height: 35))
        btn.imageEdgeInsets = UIEdgeInsets(top: 60, left: 60, bottom: 60, right: 55)
        btn.setImage(#imageLiteral(resourceName: "Websitepng"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(website), for: .touchUpInside)
        return btn
    }()

    @objc func website() {
        let site = CompanyWebsite
        UIApplication.shared.open(URL(string: "https://\(site)")! as URL, options: [:], completionHandler: nil)
    }
    
    
    
    
    func configureViewComponents() {
                backView.addSubview(CompanyPicture)
                CompanyPicture.anchor(top: backView.topAnchor, left: backView.leftAnchor, bottom: nil, right: backView.rightAnchor, paddingTop: 0, paddingLeft: 0 , paddingBottom: 0, paddingRight: 0, width: screenWidth, height: 410 / 1.8)

                backView.addSubview(logoImageView)
                logoImageView.anchor(top: CompanyPicture.topAnchor, left: backView.leftAnchor, bottom: nil, right: backView.rightAnchor, paddingTop: 410 / 1.8 + 5, paddingLeft: screenWidth - 200 , paddingBottom: 0, paddingRight: 5, width: screenWidth, height: 90)

                backView.addSubview(CompanyName)
                CompanyName.anchor(top: backView.topAnchor, left: backView.leftAnchor, bottom: nil, right: logoImageView.rightAnchor, paddingTop: 410 / 1.8 + 5, paddingLeft: 5 , paddingBottom: 0, paddingRight: screenWidth - 180, width: screenWidth, height: 50)
        
                backView.addSubview(CompanyType)
                CompanyType.anchor(top: CompanyName.bottomAnchor, left: backView.leftAnchor, bottom: nil, right: logoImageView.rightAnchor, paddingTop: 5, paddingLeft: 5 , paddingBottom: 0, paddingRight: screenWidth - 180, width: screenWidth, height: 50)

                backView.addSubview(actualdistancelbl)
                actualdistancelbl.anchor(top: CompanyType.bottomAnchor, left: backView.leftAnchor, bottom: nil, right: logoImageView.rightAnchor, paddingTop: 5, paddingLeft: 5 , paddingBottom: 0, paddingRight: screenWidth - 180, width: screenWidth, height: 50)

               backView.addSubview(websitebutt)
                websitebutt.anchor(top: nil, left: backView.leftAnchor, bottom: backView.bottomAnchor, right: backView.rightAnchor, paddingTop: 0, paddingLeft: screenWidth - 50, paddingBottom: 10, paddingRight: 5, width: screenWidth, height: 60)

               backView.addSubview(phonebutt)
                phonebutt.anchor(top: nil, left: backView.leftAnchor, bottom: backView.bottomAnchor, right: websitebutt.rightAnchor, paddingTop: 0, paddingLeft: screenWidth - 100, paddingBottom: 10, paddingRight: 50, width: screenWidth, height: 60)

               backView.addSubview(directionbutt)
                directionbutt.anchor(top: nil, left: backView.leftAnchor, bottom: backView.bottomAnchor, right: phonebutt.rightAnchor, paddingTop: 0, paddingLeft: screenWidth - 150, paddingBottom: 10, paddingRight: 50, width: screenWidth, height: 60)


    }
}

