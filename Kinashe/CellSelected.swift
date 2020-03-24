//
//  CellSelected.swift
//  Kinashe
//
//  Created by Matthew Daniel Robi on 10/24/19.
//  Copyright © 2019 Emmanuel Daniel Robi. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds

//Creates layout for selected Cell
class SelectedController : UIViewController, UIScrollViewDelegate, GADInterstitialDelegate {
    var interstitial: GADInterstitial!
    var pictureArrayholder: NSArray = []
    var couponholder: NSArray = []
    var isChecked = true
    var Standard_Time = [] as Array
    
    var Everyday: NSArray = []
    var Monday: NSArray = []
    var Tuesday: NSArray = []
    var Wednesday: NSArray = []
    var Thursday: NSArray = []
    var Friday: NSArray = []
    var Saturday: NSArray = []
    var Sunday: NSArray = []
    
    // This will be variables that get its data from the arrays below. look at Business_Hour_Config function below to see how
    var Monday_Open: String = ""
    var Monday_Closed: String = ""
    var Tuesday_Open: String = ""
    var Tuesday_Closed: String = ""
    var Wednesday_Open: String = ""
    var Wednesday_Closed: String = ""
    var Thursday_Open: String = ""
    var Thursday_Closed: String = ""
    var Friday_Open: String = ""
    var Friday_Closed: String = ""
    var Saturday_Open: String = ""
    var Saturday_Closed: String = ""
    var Sunday_Open: String = ""
    var Sunday_Closed: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Coupon_Maker_English()
        // initialize company description in english
        self.CompanyDescription.text = CompanyDescriptionText
        Business_Hour_Config()
        NavBar()
        view.addSubview(scrollView)
        setupScrollView()
        configureViewComponents()
        navigationController?.navigationBar.isHidden = false
        
        //Important Google ad unit
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-7207470851522216/6195212805")
        interstitial.delegate = self
        let request = GADRequest()
        interstitial.load(request)
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready yet")
        }
    }
    
    func Business_Hour_Config() {
        // Sets the variable holders
        Monday = self.Everyday.object(at: 0) as! NSArray
        Tuesday = self.Everyday.object(at: 1) as! NSArray
        Wednesday = self.Everyday.object(at: 2) as! NSArray
        Thursday = self.Everyday.object(at: 3) as! NSArray
        Friday = self.Everyday.object(at: 4) as! NSArray
        Saturday = self.Everyday.object(at: 5) as! NSArray
        Sunday = self.Everyday.object(at: 6) as! NSArray
               
        // Pulls from temporary open and close variables at the top of this document
        Monday_Open = self.Monday.firstObject as! String
        Monday_Closed = self.Monday.lastObject as! String
        Tuesday_Open = self.Tuesday.firstObject as! String
        Tuesday_Closed = self.Tuesday.lastObject as! String
        Wednesday_Open = self.Wednesday.firstObject as! String
        Wednesday_Closed = self.Wednesday.lastObject as! String
        Thursday_Open = self.Thursday.firstObject as! String
        Thursday_Closed = self.Thursday.lastObject as! String
        Friday_Open = self.Friday.firstObject as! String
        Friday_Closed = self.Friday.lastObject as! String
        Saturday_Open = self.Saturday.firstObject as! String
        Saturday_Closed = self.Saturday.lastObject as! String
        Sunday_Open = self.Sunday.firstObject as! String
        Sunday_Closed = self.Sunday.lastObject as! String
        
        
        var Military_Time: Array = [Monday_Open, Monday_Closed, Tuesday_Open, Tuesday_Closed, Wednesday_Open, Wednesday_Closed, Thursday_Open, Thursday_Closed, Friday_Open, Friday_Closed, Saturday_Open, Saturday_Closed, Sunday_Open,Sunday_Closed]
        
        // Below converts from military time to standard time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let date = dateFormatter.date(from: Monday_Closed)
        
        dateFormatter.dateFormat = "h:mm a"
        
        let Date12 = dateFormatter.string(from: date!)
        
        for i in 0..<Military_Time.count {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let date = dateFormatter.date(from: Military_Time[i] as! String)
            dateFormatter.dateFormat = "h:mm a"
            let Date12 = dateFormatter.string(from: date!)
            Military_Time[i] = Date12
        }
        
        Standard_Time = Military_Time
        
        self.CompanySchedule.text = "Monday: \(Standard_Time[0]) - \(Standard_Time[1]) \nTuesday: \(Standard_Time[2]) - \(Standard_Time[3]) \nWednesday: \(Standard_Time[4]) - \(Standard_Time[5]) \nThursday: \(Standard_Time[6]) - \(Standard_Time[7]) \nFriday: \(Standard_Time[8]) - \(Standard_Time[9]) \nSaturday: \(Standard_Time[10]) - \(Standard_Time[11]) \nSunday: \(Standard_Time[12]) - \(Standard_Time[13])"
    }

    
    // Present google ad
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
         interstitial.present(fromRootViewController: self)
        print("interstitialDidReceiveAd")

     }
    
    // Tells the delegate an ad request failed.
    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
      print("interstitial:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    func NavBar() {
        self.navigationItem.title = "Deal | ቅናሽ"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        view.backgroundColor = .AppDarkBlue()
        navigationController?.navigationBar.barTintColor = UIColor.AppDarkBlue()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.CouponColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Translate | መተርጎም", style: .plain, target: self, action: #selector(Translate_Pressed))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.CouponColor()
        }

  
    lazy var scrollView: UIScrollView = {
       let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize.height = 600 + CGFloat((140 * counter))
        view.backgroundColor = UIColor.AppDarkBlue()
        return view
    }()

    func setupScrollView(){
          scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
          scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    //            cell.HomePagePhoto = filteredData[indexPath.row].pictures.object(at: 0) as! String

    
    let screen = UIScreen.main.bounds.width
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    lazy var logoImageView: UIScrollView = {
        let iv = UIScrollView()
        iv.frame = view.frame
            for i in 0..<pictureArrayholder.count {
            let imageView = UIImageView()
            let Test = pictureArrayholder[i]
            imageView.sd_setImage(with: URL(string: "\(Test)"), completed: nil)
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: iv.frame.width, height: 300 )
            iv.contentSize.width = iv.frame.width * CGFloat(i + 1)
            iv.isPagingEnabled = true
            imageView.contentMode = .scaleToFill
            iv.addSubview(imageView)
        }
        return iv
    }()
    
    
    let CompanySchedule: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 10)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textColor = UIColor.white
        lbl.numberOfLines = 10
    return lbl
    }()
    
    
    let CompanyCoupon: UILabel = {
         let lbl = UILabel()
         lbl.textAlignment = .left
         lbl.font = UIFont.boldSystemFont(ofSize: 20)
         lbl.adjustsFontSizeToFitWidth = true
         lbl.textColor = .white
         lbl.numberOfLines = 0
    return lbl
     }()
    
    let CompanyCouponTranslated: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textColor = .white
        lbl.numberOfLines = 0
    return lbl
    }()
    
    let CompanyName: UILabel = {
        let lbl = UILabel()
            lbl.textAlignment = .left
            lbl.numberOfLines = 2
            lbl.font = UIFont.boldSystemFont(ofSize: 30)
            lbl.adjustsFontSizeToFitWidth = true
            lbl.textColor = UIColor.white
            lbl.textAlignment = NSTextAlignment.center;
        return lbl
    }()
    
    lazy var CompanyDescription: UILabel = {
        let lbl = UILabel(frame: CGRect())
            lbl.textAlignment = .left
            lbl.font = UIFont.boldSystemFont(ofSize: 10)
            lbl.adjustsFontSizeToFitWidth = true
            lbl.textColor = UIColor.white
            lbl.numberOfLines = 0
        return lbl
    }()
    
    var CompanyDescriptionText = ""
    var CompanyDescriptionTranslatedText = ""

    let directionbutt2: UIButton = {
        let btn = UIButton()
        btn.imageEdgeInsets = UIEdgeInsets(top: 55, left: 65, bottom: 55, right: 55)
        btn.setImage(#imageLiteral(resourceName: "Navigation"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(direction), for: .touchUpInside)
        return btn
        
    }()
    
    let phonebutt2: UIButton = {
        let btn = UIButton()
        btn.imageEdgeInsets = UIEdgeInsets(top: 55, left: 65, bottom: 55, right: 55)
        btn.setImage(#imageLiteral(resourceName: "Phone"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(caller), for: .touchUpInside)
        return btn
    }()
    
    //Temporary phone number variable
    var phoneNumber: String = ""

    // when phone button is pressed the function will call business
    @objc func caller() {
        let number = phoneNumber
        if let url = URL(string: "tel://\(number)") {
            UIApplication.shared.openURL(url)
        }

    }
    
    
    let websitebutt2: UIButton = {
        let btn = UIButton()
        btn.imageEdgeInsets = UIEdgeInsets(top: 55, left: 60, bottom: 55, right: 60)
        btn.setImage(#imageLiteral(resourceName: "Websitepng"), for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(website), for: .touchUpInside)
        return btn
    }()
    // Temporary website link variable
    var CompanyWebsite: String = ""
    
    // when website button is pressed the function will send user to business website
    @objc func website() {
        let site = CompanyWebsite
        UIApplication.shared.open(URL(string: "https://\(site)")! as URL, options: [:], completionHandler: nil)
    }

    // CompanyDirectionLink, lat, and lon are variable holder that will receive real data from previous screen. It is necessary for creating the link that sends directions to address
    var CompanyDirectionLink: String = ""
    var lat: String = "0.00"
    var long: String = "0.00"

    // This creates a link that takes in the lat and lon variables that are generated from the business for directions
    @objc func direction() {
         let site = CompanyDirectionLink
         UIApplication.shared.open(URL(string: "https://www.google.com/maps/search/?api=1&query=\(lat),\(long)")! as URL, options: [:], completionHandler: nil)
     }
    
    lazy var couponView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Coupon")
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var couponViewTranslated: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Coupon")
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        return iv
    }()
    
        lazy var totalImage: UILabel = {
            let lbl = UILabel()
            lbl.textAlignment = .left
            lbl.font = UIFont.boldSystemFont(ofSize: 50)
            lbl.adjustsFontSizeToFitWidth = true
            lbl.textColor = .white
            lbl.numberOfLines = 0
            let totalImages = pictureArrayholder.count
            lbl.text = "\(totalImages)"
            return lbl
        }()
    
    let Camera: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "totalPictures")
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        return img
    }()
    
    // from the top where coupons will begin generating
    var coupondistance = 550
    // counter for how many coupons are in the array so it knows how many coupon images it should reproduce
    var counter = 0
    
    // Switches language of all labels when tranlation button is pressed
    @objc func Translate_Pressed(_ sender: UIButton) {
          isChecked = !isChecked
          if isChecked {
            //For english
             view.addSubview(scrollView)
             coupondistance = 550
             counter = 0
             setupScrollView()
             configureViewComponents()
            self.CompanySchedule.text = "Monday: \(Standard_Time[0]) - \(Standard_Time[1]) \nTuesday: \(Standard_Time[2]) - \(Standard_Time[3]) \nWednesday: \(Standard_Time[4]) - \(Standard_Time[5]) \nThursday: \(Standard_Time[6]) - \(Standard_Time[7]) \nFriday: \(Standard_Time[8]) - \(Standard_Time[9]) \nSaturday: \(Standard_Time[10]) - \(Standard_Time[11]) \nSunday: \(Standard_Time[12]) - \(Standard_Time[13])"
            CompanyDescription.text = CompanyDescriptionText
             Coupon_Maker_English()

          } else {
            // For amharic
              view.addSubview(scrollView)
              coupondistance = 550
              counter = 0
              setupScrollView()
              configureViewComponents()
            self.CompanySchedule.text = "ሰኞ: \(Standard_Time[0]) - \(Standard_Time[1]) \nማክሰኞ: \(Standard_Time[2]) - \(Standard_Time[3]) \nእሮብ: \(Standard_Time[4]) - \(Standard_Time[5]) \nሐሙስ: \(Standard_Time[6]) - \(Standard_Time[7]) \nአርብ: \(Standard_Time[8]) - \(Standard_Time[9]) \nቅዳሜ: \(Standard_Time[10]) - \(Standard_Time[11]) \nእሁድ: \(Standard_Time[12]) - \(Standard_Time[13])"
                CompanyDescription.text = CompanyDescriptionTranslatedText
              Coupon_Maker_Amharic()

          }
      }
      
    // Makes coupon in english
    func Coupon_Maker_English() {
        for i in 0..<couponholder.count {
            let array = couponholder[i] as! NSDictionary
            let active = array.value(forKey: "active") as! Bool
            let availability = array.value(forKey: "availability")
            let availabilityTrans = array.value(forKey: "availabilityTrans")
            let deal = array.value(forKey: "deal")
            let dealTrans = array.value(forKey: "dealTrans")
            let expTimestamp = array.value(forKey: "expTimestamp") as! Int
            let expiration = array.value(forKey: "expiration")
            let title = array.value(forKey: "title")
            let titleTrans = array.value(forKey: "titleTrans")
            let iv = UIImageView()
            iv.image = UIImage(named: "Coupon")
            iv.contentMode = .scaleToFill
            iv.clipsToBounds = true
            iv.frame = CGRect(x: 0, y: coupondistance, width: Int(screenWidth), height: 140)

            let lbl = UILabel()
            lbl.textAlignment = .left
            lbl.font = UIFont.boldSystemFont(ofSize: 10)
            lbl.adjustsFontSizeToFitWidth = true
            lbl.textColor = .white
            lbl.numberOfLines = 0
            lbl.text = "Coupon: \(title ?? "") \nDeal: \(deal ?? "") \nAvailable: \(availability ?? "") \nExpires: \(expiration ?? "")"
            lbl.frame = CGRect(x: 45, y: coupondistance, width: Int(screenWidth - 140), height: 140)
            
            //Validate expiration date of coupon then removes it if it has expired
            let currentTime = Date().timeIntervalSince1970
            let comingFromTheServer = TimeInterval(expTimestamp) / 1000
            let expirationchecker = ((currentTime - comingFromTheServer) / 60)
            
            if (expirationchecker < 0) && (active == true) {
                counter = counter + 1

                coupondistance = coupondistance + 145
                scrollView.addSubview(iv)
                scrollView.addSubview(lbl)
            } else if (expirationchecker > 0 || active == true) {
            }
            // Add scrolling space to the view
            scrollView.contentSize.height = 600 + CGFloat((145 * counter))
        }
    }
    
    // Makes coupons in amharic
    func Coupon_Maker_Amharic() {
        for i in 0..<couponholder.count {
            let array = couponholder[i] as! NSDictionary
            let active = array.value(forKey: "active") as! Bool
            let availability = array.value(forKey: "availability")
            let availabilityTrans = array.value(forKey: "availabilityTrans")
            let deal = array.value(forKey: "deal")
            let dealTrans = array.value(forKey: "dealTrans")
            let expTimestamp = array.value(forKey: "expTimestamp") as! Int
            let expiration = array.value(forKey: "expiration")
            let title = array.value(forKey: "title")
            let titleTrans = array.value(forKey: "titleTrans")
            let iv = UIImageView()
            iv.image = UIImage(named: "Coupon")
            iv.contentMode = .scaleToFill
            iv.clipsToBounds = true
            iv.frame = CGRect(x: 0, y: coupondistance, width: Int(screenWidth), height: 140)

            let lbl = UILabel()
            lbl.textAlignment = .left
            lbl.font = UIFont.boldSystemFont(ofSize: 10)
            lbl.adjustsFontSizeToFitWidth = true
            lbl.textColor = .white
            lbl.numberOfLines = 0
            lbl.text = "ኩፖን: \(titleTrans ?? "") \nቅናሽ: \(dealTrans ?? "") \nየሚገኝ ሲሆን: \(availabilityTrans ?? "") \nጊዜው ያልፍበታል: \(expiration ?? "")"
            lbl.frame = CGRect(x: 45, y: coupondistance, width: Int(screenWidth - 140), height: 140)
            
            //Validate expiration date of coupon then removes it if it has expired
            let currentTime = Date().timeIntervalSince1970
            let comingFromTheServer = TimeInterval(expTimestamp) / 1000
            let expirationchecker = ((currentTime - comingFromTheServer) / 60)
            
            if (expirationchecker < 0) && (active == true) {
                counter = counter + 1

                coupondistance = coupondistance + 145
                scrollView.addSubview(iv)
                scrollView.addSubview(lbl)
            } else if (expirationchecker > 0 || active == true) {
            }
            // Add scrolling space to the view
            scrollView.contentSize.height = 600 + CGFloat((145 * counter))
        }
    }


    func configureViewComponents() {
        scrollView.addSubview(logoImageView)
        logoImageView.anchor(top: scrollView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: screenWidth, height: 300)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        scrollView.addSubview(totalImage)
        totalImage.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 268, paddingLeft: 30, paddingBottom: 0, paddingRight:  screenWidth - 45, width: 300, height: 20)

        scrollView.addSubview(Camera)
        Camera.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 270, paddingLeft: 10, paddingBottom: 0, paddingRight:  screenWidth - 25, width: 300, height: 15)

        scrollView.addSubview(CompanyName)
        CompanyName.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 300, height: 50)
          
        scrollView.addSubview(CompanyDescription)
        CompanyDescription.anchor(top: CompanyName.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: screenWidth , height: 100)

        scrollView.addSubview(CompanySchedule)
        CompanySchedule.anchor(top: CompanyDescription.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 15, paddingBottom: 0, paddingRight: screenWidth - 180, width: screenWidth , height: 80)
        
        scrollView.addSubview(websitebutt2)
        websitebutt2.anchor(top: CompanyDescription.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 15, paddingLeft: screenWidth - 70, paddingBottom: 0, paddingRight: 5, width: 0 , height: 60)
        
        scrollView.addSubview(phonebutt2)
        phonebutt2.anchor(top: CompanyDescription.bottomAnchor, left: view.leftAnchor, bottom: nil, right: websitebutt2.rightAnchor, paddingTop: 15, paddingLeft: screenWidth - 100, paddingBottom: 0, paddingRight: 50, width: 0 , height: 60)
        
        scrollView.addSubview(directionbutt2)
        directionbutt2.anchor(top: CompanyDescription.bottomAnchor, left: view.leftAnchor, bottom: nil, right: phonebutt2.rightAnchor, paddingTop: 15, paddingLeft: screenWidth - 150, paddingBottom: 0, paddingRight: 50, width: 0 , height: 60)
        
        // If there is no website, it will hide the website button
        if CompanyWebsite == "" {
            websitebutt2.isHidden = true
        } else {
            websitebutt2.isHidden = false
        }
        
        // If there is no number, it will hide the phone button
        if phoneNumber == "" {
             phonebutt2.isHidden = true
         } else {
             phonebutt2.isHidden = false
         }
        
        // If there is no address, it will hide the navigation button
        if long == "" && lat == "" {
             directionbutt2.isHidden = true
         } else {
             directionbutt2.isHidden = false
         }
    }
    
}

