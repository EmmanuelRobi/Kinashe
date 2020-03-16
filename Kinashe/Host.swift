//
//  Host.swift
//  Kinashe
//
//  Created by Matthew Daniel Robi on 10/24/19.
//  Copyright © 2019 Emmanuel Daniel Robi. All rights reserved.
//

import Foundation
import CoreLocation

class Business_Information {
    var Name: String
    var BusinessType: String
    var Number: String
    var Description: String
    var Description_Translated: String
    var Website: String
    var Distance: Double
    var Lat: String
    var Lon: String
    var verified: Bool
    var pictures: NSArray
    var schedule: NSArray
    var coupon: NSArray
    var payment: Int
    var paymentExpiration: Int
    
    init (nameText: String, typeText: String, numberText: String, descriptionText: String, descriptiontranslatedText: String, websiteText: String, distanceText: Double, latText: String, lonText: String, verifiedText: Bool, picturesText: NSArray, scheduleText: NSArray, couponText: NSArray, paymentText: Int, paymentExpirationText: Int) {
        Name = nameText
        BusinessType = typeText
        Number = numberText
        Description = descriptionText
        Description_Translated = descriptiontranslatedText
        Website = websiteText
        Distance = distanceText
        Lat = latText
        Lon = lonText
        verified = verifiedText
        pictures = picturesText
        schedule = scheduleText
        coupon = couponText
        payment = paymentText
        paymentExpiration = paymentExpirationText
    
    }
}

//Advertisments -> ID -> Info
class Business_Advertisment {
    var Title: String
    var Description: String
    var Image_Url: String
    var Active: Bool
    var Business_Key: String
    var Start_Date: Int
    
    init (Title_Text: String, Description_Text: String, Image_Url_Text: String, Active_Status: Bool, Business_Key_Text: String, Start_Date_Text: Int) {
        Title = Title_Text
        Description = Description_Text
        Image_Url = Image_Url_Text
        Active = Active_Status
        Business_Key = Business_Key_Text
        Start_Date = Start_Date_Text
    }
}

