//
//  MainPage.swift
//  The Ethiopian Tour
//
//  Created by Matthew Daniel Robi on 10/14/19.
//  Copyright © 2019 Emmanuel Robi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import SDWebImage
import CoreLocation
import MapKit

class MainResultsController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
        var array = [Business_Information]()
        var isSearching = false
        var filteredData = [Business_Information]()
        var images: [String] = []
        var Advertisment_Array = [Business_Advertisment]()
        var refreshControl = UIRefreshControl()
        private var myTableView: UITableView!
            
            override func viewDidLoad() {
                super.viewDidLoad()
                setTableView()
                load()
                NavBar()
                refreshControl.attributedTitle = NSAttributedString(string: "Fetching Exclusive Deals")
                refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
                myTableView.addSubview(refreshControl)
                myTableView.keyboardDismissMode = UIScrollView.KeyboardDismissMode.onDrag
          }
            // Loads Navigation Bar with "Kinashe Text"
            func NavBar() {
                let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
                navigationController?.navigationBar.titleTextAttributes = textAttributes
                view.backgroundColor = .AppDarkBlue()
                navigationController?.navigationBar.barTintColor = UIColor.AppDarkBlue()
                navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                navigationItem.backBarButtonItem?.tintColor = UIColor.white
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
                imageView.contentMode = .scaleAspectFill
                let image = UIImage(named: "NavigationBar")
                imageView.image = image
                navigationItem.titleView = imageView
            }
            // Refresh Pull for reloding data
            @objc func refresh(sender:AnyObject) {
                DispatchQueue.main.async {
                    self.array.removeAll()
                    self.load()
                    self.myTableView.reloadData()
                    self.refreshControl.endRefreshing()
                }
            }
   
            // Setup view where cells are made according to devices dimensions
            func setTableView() {
                let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
                let displayWidth: CGFloat = self.view.frame.width
                let displayHeight: CGFloat = self.view.frame.height
                myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
                myTableView.backgroundColor = UIColor.clear
                myTableView.delegate = self
                myTableView.dataSource = self
                myTableView.separatorColor = UIColor.clear
                myTableView.backgroundColor = UIColor.clear
                self.view.addSubview(myTableView)
                myTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "MyCell")
            }
    

    // Array of the business type parents in the database
    var Database_Parents = ["Airport", "Bakery", "Bank", "Bar-Club", "Barber", "Bookstore", "Butcher Shop", "Cafe", "Car Rental", "Church", "Clothes", "Cosmetics", "Cultural", "Electronics", "Fitness and Health", "Footwear", "Gas", "Grocery Store", "Guest house", "Hardware", "Hospital", "Hotel", "Jewelry", "Monument", "Movie Theater", "Museum", "Other","Park-Recreation", "Pharmacy", "Restaurant", "Salon", "School", "Sightseeing", "Spa", "Sporting Goods", "Taxi", "Train", "Travel Agency"]
    
    // Reads Database
     @objc func load() {
        for type in Database_Parents {
        Database.database().reference().child(type).observe(.childAdded, with: {(snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                // Gets Company Name
                var nameText = "" as String
                if dict["companyName"] == nil {
                    nameText.self = "" as String
                } else {
                    nameText.self = dict["companyName"] as! String
                }
                
                // Gets Company Type
                var typeText = ""  as String
                if dict["businessType"] == nil {
                    typeText.self = "" as String
                } else {
                    typeText.self = dict["businessType"] as! String
                }
                
                // Gets Company Number
                var numberText = ""  as String
                if dict["phone"] == nil {
                    numberText.self = "" as String
                } else {
                    numberText.self = dict["phone"] as! String
                }
                
                // Gets Company Description
                var descriptionText = ""  as String
                if dict["description"] == nil {
                    descriptionText.self = "" as String
                } else {
                    descriptionText.self = dict["description"] as! String
                }
                
                // Gets Company Translated Description
                var descriptiontranslatedText = "" as String
                if dict["descriptionTrans"] == nil {
                    descriptiontranslatedText.self = "" as String
                } else {
                    descriptiontranslatedText.self = dict["descriptionTrans"] as! String
                }
                
                // Gets Company Website
                var websiteText = "" as String
                if dict["website"] == nil {
                    websiteText.self = "" as String
                } else {
                    websiteText.self = dict["website"] as! String
                }
                
                // Gets Company Lat
                var latText = dict["lat"] as! String
                if dict["lat"] == nil {
                    latText.self = "0.0" as String
                } else {
                    latText.self = dict["lat"] as! String
                }
                
                // Gets Company Lon
                var lonText = dict["long"] as! String
                if dict["long"] == nil {
                    lonText.self = "0.0" as String
                } else {
                    lonText.self = dict["long"] as! String
                }
                
                
                var verifiedText = false as Bool
                if dict["verified"] == nil {
                    verifiedText.self = false as Bool
                } else {
                    verifiedText.self = dict["verified"] as! Bool
                }
        
                var picturesText = [] as NSArray
                if dict["photos"] == nil {
                    picturesText.self = [] as NSArray
                } else {
                    picturesText.self = dict["photos"] as! NSArray
                }
                
                var scheduleText = [] as NSArray
                if dict["hours"] == nil {
                    scheduleText.self = [] as NSArray
                } else {
                    scheduleText.self = dict["hours"] as! NSArray
                }
                
                
                var paymentText = dict["monthlyPayment"] as! Int
                var couponText = [] as NSArray
                        
                        if dict["coupons"] == nil {
                            couponText.self = [] as NSArray
                        } else{
                            couponText.self = dict["coupons"] as! NSArray
                        }
                                        
                var paymentExpirationText: Int
                                     
                        if dict["paymentExpiration"] == nil {
                            paymentExpirationText = 1579420800000 as Int
                        } else{
                            paymentExpirationText = dict["paymentExpiration"] as! Int
                        }

                // Location Permission
                let locationManager = CLLocationManager()
                
                // Get User Lat and Lon
                var lat = locationManager.location?.coordinate.latitude
                var lon = locationManager.location?.coordinate.longitude
                
                // If lat or lon is nil
                if locationManager.location?.coordinate.longitude == nil || locationManager.location?.coordinate.latitude == nil {
                    lat.self = 0.0
                    lon.self = 0.0
                    
                } else {
                    lat.self = 0.0
                    lon.self = 0.0
                }
                // Puts User Lat and Lon into CCLocation type
                let coordinate = CLLocation(latitude: lat!, longitude: lon!)
                
                
                // Puts Business Lat in CCLocation Type
                var location: CLLocation {
                    return CLLocation(latitude: Double(latText)!, longitude: Double(lonText)!)
                }
                    
                // Calculates Distance
                func distance(to location: CLLocation) -> CLLocationDistance {
                    return location.distance(from: location)
                }
                
                // Distance from business Label
                let distanceText = Double(Double(location.distance(from: coordinate) / 1000).rounded())

                // Current Timestamp
                let currentTime = Date().timeIntervalSince1970
                
                // Business Timestamp for payment expiration
                let comingFromTheServer = TimeInterval(paymentExpirationText) / 1000
                
                // Validates expiration
                let expirationchecker = ((currentTime - comingFromTheServer) / 60)
                if (expirationchecker > 0) {
                    paymentText = 0
                }
                
                // Stores everything into variables into the class which is in another document called "Host"
                let business = Business_Information(nameText: nameText, typeText: typeText, numberText: numberText, descriptionText: descriptionText, descriptiontranslatedText: descriptiontranslatedText, websiteText: websiteText, distanceText: distanceText, latText: latText, lonText: lonText, verifiedText: verifiedText, picturesText: picturesText, scheduleText: scheduleText, couponText: couponText, paymentText: paymentText, paymentExpirationText: paymentExpirationText)
                
                // Pulls the array
                self.array.append(business)
                
                // Removes businesses that are not verified
                self.array.removeAll(where: {$0.verified == false})
                
                // Sorts by shortest distance to longest
                self.array.sort(by: {$0.Distance > $1.Distance})
                
                // Sorts by payments made
                self.array.sort(by: {$0.payment > $1.payment})
                
                // Refresh all data
                self.myTableView.reloadData()
            }})}}

            // Sends to selected data to next view
            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let nextVC = SelectedController()
                if isSearching {
                    nextVC.CompanyName.text = filteredData[indexPath.row].Name
                    nextVC.lat = filteredData[indexPath.row].Lat
                    nextVC.long = filteredData[indexPath.row].Lon
                    nextVC.CompanyWebsite = filteredData[indexPath.row].Website
                    nextVC.phoneNumber = filteredData[indexPath.row].Number
                    nextVC.Everyday = filteredData[indexPath.row].schedule
                    nextVC.pictureArrayholder = filteredData[indexPath.row].pictures
                    nextVC.couponholder = filteredData[indexPath.row].coupon
                    nextVC.CompanyDescriptionText = filteredData[indexPath.row].Description
                    nextVC.CompanyDescriptionTranslatedText = filteredData[indexPath.row].Description_Translated
                    navigationController?.pushViewController(nextVC, animated: true)
                } else {
                    nextVC.CompanyName.text = array[indexPath.row].Name
                    nextVC.lat = array[indexPath.row].Lat
                    nextVC.long = array[indexPath.row].Lon
                    nextVC.CompanyWebsite = array[indexPath.row].Website
                    nextVC.phoneNumber = array[indexPath.row].Number
                    nextVC.Everyday = array[indexPath.row].schedule
                    nextVC.pictureArrayholder = array[indexPath.row].pictures
                    nextVC.couponholder = array[indexPath.row].coupon
                    nextVC.CompanyDescriptionText = array[indexPath.row].Description
                    nextVC.CompanyDescriptionTranslatedText = array[indexPath.row].Description_Translated
                    navigationController?.pushViewController(nextVC, animated: true)
                }
            }

           // Creates total Cells necessary
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                   return array.count
            }
            
            // Function will put data into the appropriate parts of the cell
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? CustomTableViewCell else {fatalError("Unable to create cell")}

                cell.CompanyName.text = array[indexPath.row].Name
                cell.CompanyType.text =  array[indexPath.row].BusinessType
                cell.Lat = Double(array[indexPath.row].Lat) as! CLLocationDegrees
                cell.Lon = Double(array[indexPath.row].Lon) as! CLLocationDegrees
                cell.CompanyDesc = array[indexPath.row].Description
                cell.phoneNumber = array[indexPath.row].Number
                cell.CompanyWebsite = array[indexPath.row].Website
                cell.selectionStyle = .none
                cell.pictureArrayholder = array[indexPath.row].pictures
                cell.HomePagePhoto = array[indexPath.row].pictures.object(at: 0) as! String

                   // Hide Phone Button if No number is provided into db
                   if  cell.phoneNumber == "" {
                       cell.phonebutt.isHidden = true
                   } else {
                       cell.phonebutt.isHidden = false
                   }
                   // Hide Navigation Button if No address is provided into db
                   if  cell.Lat == 0.0 {
                       cell.directionbutt.isHidden = true
                       cell.actualdistancelbl.isHidden = true
                   } else {
                       cell.directionbutt.isHidden = false
                       cell.actualdistancelbl.isHidden = false
                   }
                   //Hide Description if no desc is given
                   if  cell.CompanyDesc  == "" {
                       cell.CompanyDescription.isHidden = true
                       
                   } else {
                       cell.CompanyDescription.isHidden = false
                   }
                   //Hide websitebutton if no website is given

                   if  cell.CompanyWebsite == "" {
                       cell.websitebutt.isHidden = true
                   } else {
                       cell.websitebutt.isHidden = false
                   }
                // Hide Deal Available if no deal is provided
                if cell.CompanyDeal == "" {
                    cell.logoImageView.isHidden = true
                } else {
                    cell.logoImageView.isHidden = false
                }
                return cell
            }
             
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return 410
            }
        }

