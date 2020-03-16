//
//  TaxiResults.swift
//  The Ethiopian Tour
//
//  Created by Matthew Daniel Robi on 10/17/19.
//  Copyright © 2019 Emmanuel Robi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import SDWebImage
import CoreLocation
import MapKit

class TaxiController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
     var array = [CouponTest]()
        var isSearching = false
        var filteredData = [CouponTest]()

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
        
        func NavBar() {
            self.navigationItem.title = "Taxi | ታክሲ"
            let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            navigationController?.navigationBar.titleTextAttributes = textAttributes
            view.backgroundColor = .AppDarkBlue()
            navigationController?.navigationBar.barTintColor = UIColor.AppDarkBlue()
            navigationItem.searchController = searchController
            navigationItem.searchController?.searchBar.placeholder = "Search"
            navigationItem.hidesSearchBarWhenScrolling = false
            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            searchController.searchBar.showsCancelButton = false
            self.searchController.hidesNavigationBarDuringPresentation = false
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            navigationItem.backBarButtonItem?.tintColor = UIColor.white

        }
            
        @objc func refresh(sender:AnyObject) {
            DispatchQueue.main.async {
                    self.array.removeAll()
                   // self.filteredData.removeAll()
                    self.load()
                    self.myTableView.reloadData()
                    self.refreshControl.endRefreshing()
            }
        }

        lazy var searchController: UISearchController = {
            let searchController = UISearchController (searchResultsController: nil)
            searchController.dimsBackgroundDuringPresentation = false
            searchController.searchBar.delegate = self
            self.myTableView.reloadData()
            searchController.searchBar.delegate = self
            return searchController
        }()
        
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
        
        @objc func load() {
                Database.database().reference().child("TestingCouponLoop").observe(.childAdded, with: {(snapshot) in
                    if let dict = snapshot.value as? [String: Any] {
                        let nameText = dict["Name"] as! String
                        let FirstPictureString = dict["Picture1"] as! String
                        let typeText = dict["Type"] as! String
                        let numberText = dict["Number"] as! String
                        let dealText = dict["Deal"] as! String
                        let descriptionText = dict["Description"] as! String
                        let websiteText = dict["Website"] as! String
                        let scheduleText = dict["Schedule"] as! String
                        let couponTranslationText = dict["CouponTranslation"] as! String
                        let DirectionLinkText = dict["DirectionLink"] as! String
                        let latText = dict["Lat"] as! Double
                        let lonText = dict["Lon"] as! Double
                       // let couponchecker = dict["CouponTest"] as! [Dictionary<String, String>]
                        let couponchecker = dict["CouponTest"] as? NSMutableArray

                        var distanceText: Double = 0
                        var location: CLLocation {
                            return CLLocation(latitude: latText, longitude: lonText)
                        }
                        func distance(to location: CLLocation) -> CLLocationDistance {
                            return location.distance(from: location)
                        }
                        let business = CouponTest(nameText: nameText, FirstPictureString: FirstPictureString, typeText: typeText, numberText: numberText, descriptionText: descriptionText, websiteText: websiteText, scheduleText: scheduleText, couponTranslationText: couponTranslationText, DirectionLinkText: DirectionLinkText, dealText: dealText, distanceText: location, latText: latText, lonText: lonText, arraything: couponchecker!)
                        //let holder = CouponTester(Availability: couponchecker.Availability, Deal: "Deal", Exp: "Exp")
                        self.array.append(business)
                        self.array.sort(by: { $0.distance(to: location) < $1.distance(to: location) })
                        self.myTableView.reloadData()
                     //   let test = ["Checking =", couponchecker] as [Any]
                      //  print(test[0])
                        
                        
                        
                        
                    }
                })
        }
        
        //SearchBar Filtering Tool
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText.isEmpty {
                isSearching = false
                myTableView.reloadData()
            }
            else {
                isSearching = true
                filteredData = array.filter{$0.Name.lowercased().contains(searchText.lowercased()) == true || $0.BusinessType.lowercased().contains(searchText.lowercased()) == true}
                myTableView.reloadData()
            }
            if searchBar.text == nil || searchBar.text == ""
                       {
                           searchBar.perform(#selector(self.resignFirstResponder), with: nil, afterDelay: 0.1)
            }
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let nextVC = SelectedController()
            if isSearching {
                nextVC.CompanyName.text = filteredData[indexPath.row].Name
                nextVC.CompanySchedule.text = filteredData[indexPath.row].Schedule.replace(string: ", ", replacement: "\n")
                nextVC.CompanyDescription.text = filteredData[indexPath.row].Description
                nextVC.CompanyDirectionLink = filteredData[indexPath.row].DirectionLink
                nextVC.CompanyWebsite = filteredData[indexPath.row].Website
                nextVC.phoneNumber = filteredData[indexPath.row].Number
                nextVC.CompanyCoupon.text = filteredData[indexPath.row].Deal.replace(string: ", ", replacement: "\n")
              //  nextVC.logoImageView.sd_setImage(with: URL(string: filteredData[indexPath.row].FirstPicture), completed: nil)
                nextVC.CompanyCouponTranslated.text = filteredData[indexPath.row].CouponTranslation.replace(string: ", ", replacement: "\n")
                navigationController?.pushViewController(nextVC, animated: true)
            } else {
                nextVC.CompanyName.text = array[indexPath.row].Name
                nextVC.CompanySchedule.text = array[indexPath.row].Schedule.replace(string: ", ", replacement: "\n")
                nextVC.CompanyDescription.text = array[indexPath.row].Description
                nextVC.CompanyDirectionLink = array[indexPath.row].DirectionLink
                nextVC.CompanyWebsite = array[indexPath.row].Website
                nextVC.phoneNumber = array[indexPath.row].Number
                nextVC.CompanyCoupon.text = array[indexPath.row].Deal.replace(string: ", ", replacement: "\n")
             //   nextVC.logoImageView.sd_setImage(with: URL(string: array[indexPath.row].FirstPicture), completed: nil)
                nextVC.CompanyCouponTranslated.text = array[indexPath.row].CouponTranslation.replace(string: ", ", replacement: "\n")
                navigationController?.pushViewController(nextVC, animated: true)
            }
        }

        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if isSearching {
               return filteredData.count
            }
            else {
               return array.count
            }
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? CustomTableViewCell else {fatalError("Unabel to create cell")}
            if isSearching {
                cell.CompanyDirectionLink = filteredData[indexPath.row].DirectionLink
                cell.CompanyNamer = filteredData[indexPath.row].Name
                cell.CompanyName.text = filteredData[indexPath.row].Name
                cell.CompanyType.text = filteredData[indexPath.row].BusinessType
                cell.Lat = filteredData[indexPath.row].Lat
                cell.Lon = filteredData[indexPath.row].Lon
                cell.CompanyDesc = filteredData[indexPath.row].Description
                cell.phoneNumber = filteredData[indexPath.row].Number
                cell.CompanyWebsite = filteredData[indexPath.row].Website
                cell.CompanySchedule = filteredData[indexPath.row].Schedule
                cell.CompanyDeal = filteredData[indexPath.row].Deal
            //    cell.CompanyPicture.sd_setImage(with: URL(string: filteredData[indexPath.row].FirstPicture), completed: nil)
                cell.selectionStyle = .none
                
                // Hide Phone Button if No number is provided into db\
                if  cell.phoneNumber == "" {
                    cell.phonebutt.isHidden = true
                    
                } else {
                    cell.phonebutt.isHidden = false
                }
                //Hide Description if no desc is given
                if  cell.CompanyDesc  == "" {
                    cell.CompanyDescription.isHidden = true
                } else {
                    cell.CompanyDescription.isHidden = false
                }
                // Hide Navigation Button if No address is provided into db
                if  cell.Lat == 0.0 {
                    cell.directionbutt.isHidden = true
                    cell.actualdistancelbl.isHidden = true
                } else {
                    cell.directionbutt.isHidden = false
                    cell.actualdistancelbl.isHidden = false
                }
                // Hide Web Button if No address is provided into db
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
            }
            else {
                cell.CompanyDirectionLink = array[indexPath.row].DirectionLink
                cell.CompanyNamer = array[indexPath.row].Name
                cell.CompanyName.text = array[indexPath.row].Name
                cell.CompanyType.text =  array[indexPath.row].BusinessType
                cell.Lat = array[indexPath.row].Lat
                cell.Lon = array[indexPath.row].Lon
                cell.CompanyDesc = array[indexPath.row].Description
                cell.phoneNumber = array[indexPath.row].Number
                cell.CompanyWebsite = array[indexPath.row].Website
                cell.CompanySchedule = array[indexPath.row].Schedule
                cell.CompanyDeal = array[indexPath.row].Deal
           //     cell.CompanyPicture.sd_setImage(with: URL(string: array[indexPath.row].FirstPicture), completed: nil)
                cell.selectionStyle = .none
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
            }
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 410
        }
    }

