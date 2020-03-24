//
//  HomeController.swift
//  Kinashe
//
//  Created by Matthew Daniel Robi on 10/24/19.
//  Copyright © 2019 Emmanuel Daniel Robi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import Network


    class HomeController: UIViewController {
        let monitor = NWPathMonitor()

        override func viewDidLoad() {
            super.viewDidLoad()
            createTabBarController()
        }

        override func viewDidAppear(_ animated: Bool) {
            createTabBarController()
            if CheckInternet.Connection(){
              //  self.Alert(Message: "Connected")
            }
            
            else{
                self.Alert(Message: "Cannot fetch exclusive deals. Check your connection and try again")
            }
        }
        
        func Alert (Message: String){
            
            let alert = UIAlertController(title: "No Internet Connection", message: Message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Oops", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
        }
        
              
    //Creates TabBar and connects to the four swift sources Houstle, Messaging, Job Offerings, and Account Settings
    var tabBarCnt: UITabBarController!
    
    func createTabBarController() {
        tabBarCnt = UITabBarController()
        tabBarCnt.tabBar.barStyle = .default
        tabBarCnt.tabBar.barTintColor = .AppDarkBlue()
        tabBarCnt.tabBar.tintColor = .white
        
        let firstViewController = UINavigationController(rootViewController: MainResultsController())
        firstViewController.tabBarItem.image = #imageLiteral(resourceName: "FrontPage")
        firstViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 40, left: 300, bottom: 20, right: 300)
        
        let secondViewController = UINavigationController(rootViewController: Location())
        secondViewController.tabBarItem.image = #imageLiteral(resourceName: "LocationTabBar")
        secondViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 47, left: 104, bottom: 40, right: 104)
        
        
        let thirdViewController = UINavigationController(rootViewController: TransportationController())
        thirdViewController.tabBarItem.image = #imageLiteral(resourceName: "TransportationTabBar")
        thirdViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 40, left: 100, bottom: 20, right: 100)
        
        let fourthViewController = UINavigationController(rootViewController: ContactUs())
        fourthViewController.tabBarItem.image = #imageLiteral(resourceName: "KinasheWebsite")
        fourthViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 110, left: 100, bottom: 90, right: 100)


        navigationController?.navigationBar.isHidden = true



        
        tabBarCnt.viewControllers = [firstViewController, secondViewController, thirdViewController, fourthViewController]
        self.view.addSubview(tabBarCnt.view)

                
        
        }
        
        
}
        
