//
//  LocationButton.swift
//  Kinashe
//
//  Created by Matthew Daniel Robi on 10/24/19.
//  Copyright © 2019 Emmanuel Daniel Robi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage


// Comments are the same as the "Location" Document
class Entertainment_Controller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar()
        view.addSubview(scrollView)
        setupScrollView()
        configureViewComponents()
    }
    
    func NavBar() {
        self.navigationItem.title = "Entertainment | መዝናኛ "
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
    
    func setupScrollView(){
          
          scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
          scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
  
    
   let Bar_Club_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Entertainment"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Bar_Club_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Bar_Club_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Bar and Club | መጠጥ ቤትና ጭፈራ ቤት"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(10)
        label.numberOfLines = 2
        return label
    }()
        
    @objc func Bar_Club_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Bar and Club | መጠጥ ቤትና ጭፈራ ቤት"
        myVC.Business_Type = "Bar-Club"
        myVC.Photo_Name = "Entertainment"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Cultural_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Cultural"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Cultural_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Cultural_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Cultural | ባህላዊ"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(13)
        return label
    }()

    @objc func Cultural_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Cultural | ባህላዊ"
        myVC.Business_Type = "Cultural"
        myVC.Photo_Name = "Cultural"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Movie_Theater_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Movie"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Movie_Theater_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Movie_Theater_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Movie Theater | የፊልም/ቲያትር ቤት"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(11)
        return label
    }()
    
    @objc func Movie_Theater_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Movie Theater | የፊልም/ቲያትር ቤት"
        myVC.Business_Type = "Movie Theater"
        myVC.Photo_Name = "Movie"
        navigationController?.pushViewController(myVC, animated: true)
    }

    
    let Park_Recreation_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Zoo"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Park_Recreation_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Park_Recreation_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Park-Recreation | ፓርክ-መዝናኛዎች"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(10)
        label.numberOfLines = 2
        return label
    }()
    
    @objc func Park_Recreation_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Park-Recreation | ፓርክ-መዝናኛዎች"
        myVC.Business_Type = "Park-Recreation"
        myVC.Photo_Name = "Zoo"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    func configureViewComponents() {
                  let screen = UIScreen.main.bounds
                  let screenWidth = screen.width

                 scrollView.addSubview(Bar_Club_Button)
                 Bar_Club_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
                 Bar_Club_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
                 scrollView.addSubview(Bar_Club_Label)
                 Bar_Club_Label.anchor(top: nil, left: view.leftAnchor, bottom: Bar_Club_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
                 Bar_Club_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
                 scrollView.addSubview(Cultural_Button)
                 Cultural_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
                 Cultural_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
                 scrollView.addSubview(Cultural_Label)
                 Cultural_Label.anchor(top: nil, left: view.leftAnchor, bottom: Cultural_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
                 Cultural_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
                 scrollView.addSubview(Movie_Theater_Button)
                 Movie_Theater_Button.anchor(top: (Bar_Club_Button).topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
                 Movie_Theater_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
                 scrollView.addSubview(Movie_Theater_Label)
                 Movie_Theater_Label.anchor(top: nil, left: view.leftAnchor, bottom: Movie_Theater_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
                 Movie_Theater_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
                 scrollView.addSubview(Park_Recreation_Button)
                 Park_Recreation_Button.anchor(top: Cultural_Button.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
                 Park_Recreation_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
                 scrollView.addSubview(Park_Recreation_Label)
                 Park_Recreation_Label.anchor(top: nil, left: view.leftAnchor, bottom: Park_Recreation_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
                 Park_Recreation_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}


class Food_Controller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar()
        view.addSubview(scrollView)
        setupScrollView()
        configureViewComponents()
    }
    
    func NavBar() {
        self.navigationItem.title = "Food | ምግብ "
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
    
    func setupScrollView(){
          
          scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
          scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    let Bakery_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Bakery"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Bakery_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Bakery_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Bakery | ዳቦ ቤት"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(14)
        return label
    }()
    
    @objc func Bakery_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Bakery | ዳቦ ቤት"
        myVC.Business_Type = "Bakery"
        myVC.Photo_Name = "Bakery"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Butcher_Shop_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Butcher"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Butcher_Shop_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Butcher_Shop_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Butcher Shop | ሥጋ ቤት"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(14)
        return label
    }()
    
    @objc func Butcher_Shop_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Butcher Shop | ሥጋ ቤት"
        myVC.Business_Type = "Butcher Shop"
        myVC.Photo_Name = "Butcher"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Grocery_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Grocery"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Grocery_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Grocery_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Grocery Stores | ግሮሰሪ ሱቅ"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(14)
        return label
    }()
    
    @objc func Grocery_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Grocery Stores | ግሮሰሪ ሱቅ"
        myVC.Business_Type = "Grocery Store"
        myVC.Photo_Name = "Grocery"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Restaurant_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Food"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Restaurant_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Restaurant_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Restaurant | ምግብ ቤትት"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(13)
        return label
    }()
    

    @objc func Restaurant_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Restaurant | ምግብ ቤትት"
        myVC.Business_Type = "Restaurant"
        myVC.Photo_Name = "Food"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    
    func configureViewComponents() {
        let screen = UIScreen.main.bounds
        let screenWidth = screen.width
        
        scrollView.addSubview(Bakery_Button)
        Bakery_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
        Bakery_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        scrollView.addSubview(Bakery_Label)
        Bakery_Label.anchor(top: nil, left: view.leftAnchor, bottom: Bakery_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
        Bakery_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        scrollView.addSubview(Butcher_Shop_Button)
        Butcher_Shop_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
        Butcher_Shop_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        scrollView.addSubview(Butcher_Shop_Label)
        Butcher_Shop_Label.anchor(top: nil, left: view.leftAnchor, bottom: Butcher_Shop_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
        Butcher_Shop_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        scrollView.addSubview(Grocery_Button)
        Grocery_Button.anchor(top: (Bakery_Button).topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
        Grocery_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                                    
        scrollView.addSubview(Grocery_Label)
        Grocery_Label.anchor(top: nil, left: view.leftAnchor, bottom: Grocery_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
           Grocery_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          
        scrollView.addSubview(Restaurant_Button)
        Restaurant_Button.anchor(top: Butcher_Shop_Button.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
        Restaurant_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         
        scrollView.addSubview(Restaurant_Label)
        Restaurant_Label.anchor(top: nil, left: view.leftAnchor, bottom: Restaurant_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
        Restaurant_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                        
    }
    
}



class Shopping_Controller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar()
        view.addSubview(scrollView)
        setupScrollView()
        configureViewComponents()
    }
    
    func NavBar() {
        self.navigationItem.title = "Food | ምግብ "
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
    
    func setupScrollView(){
          
          scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
          scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    let Bookstore_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Bookstore"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Bookstore_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Bookstore_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Bookstore | የመጻሕፍት መደብር"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(11)
        label.numberOfLines = 2
        return label
    }()
    
    @objc func Bookstore_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Bookstore | የመጻሕፍት መደብር"
        myVC.Business_Type = "Bookstore"
        myVC.Photo_Name = "Bookstore"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Clothes_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Clothstore"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Clothes_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Clothes_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Clothes | ልብስ"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(14)
        return label
    }()
    
    @objc func Clothes_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Clothes | ልብስ"
        myVC.Business_Type = "Clothes"
        myVC.Photo_Name = "Clothstore"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Cosmetics_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "CosmeticStore"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Cosmetics_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Cosmetics_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Cosmetics | መዋቢያዎች"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(14)
        return label
    }()
    
    @objc func Cosmetics_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Cosmetics | መዋቢያዎች"
        myVC.Business_Type = "Cosmetics"
        myVC.Photo_Name = "CosmeticStore"
        navigationController?.pushViewController(myVC, animated: true)
    }
        
    
    let Electronics_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "ElectronicsStore"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Electronics_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Electronics_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Electronics | ኤሌክትሮኒክስ"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(14)
        return label
    }()
    
    @objc func Electronics_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Electronics | ኤሌክትሮኒክስ"
        myVC.Business_Type = "Electronics"
        myVC.Photo_Name = "ElectronicsStore"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Footwear_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "FootwearStore"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Footwear_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Footwear_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Footwear | ጫማ"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(14)
        return label
    }()
    
    @objc func Footwear_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Footwear | ጫማ"
        myVC.Business_Type = "Footwear"
        myVC.Photo_Name = "FootwearStore"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Hardware_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "HardwareStore"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Hardware_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Hardware_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Hardware | ሃርድዌር"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(14)
        return label
    }()
    
    @objc func Hardware_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Hardware | ሃርድዌር"
        myVC.Business_Type = "Hardware"
        myVC.Photo_Name = "HardwareStore"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Jewelry_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "JewelryStore"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Jewelry_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Jewelry_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Jewelry | ጌጣጌጥ"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(14)
        return label
    }()
    
    @objc func Jewelry_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Jewelry | ጌጣጌጥ"
        myVC.Business_Type = "Jewelry"
        myVC.Photo_Name = "JewelryStore"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Sporting_Goods_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "SportingGoodsStore"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Sporting_Goods_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Sporting_Goods_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Sporting Goods | የስፖርት ዕቃዎች"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(11)
        return label
    }()
    
    @objc func Sporting_Goods_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Sporting Goods | የስፖርት ዕቃዎች"
        myVC.Business_Type = "Sporting Goods"
        myVC.Photo_Name = "SportingGoodsStore"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    func configureViewComponents() {
        let screen = UIScreen.main.bounds
        let screenWidth = screen.width
        
        scrollView.addSubview(Bookstore_Button)
        Bookstore_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
        Bookstore_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        scrollView.addSubview(Bookstore_Label)
        Bookstore_Label.anchor(top: nil, left: view.leftAnchor, bottom: Bookstore_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
        Bookstore_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.addSubview(Clothes_Button)
        Clothes_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
        Clothes_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        scrollView.addSubview(Clothes_Label)
        Clothes_Label.anchor(top: nil, left: view.leftAnchor, bottom: Clothes_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
        Clothes_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        scrollView.addSubview(Cosmetics_Button)
        Cosmetics_Button.anchor(top: (Bookstore_Button).topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
        Cosmetics_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                                    
        scrollView.addSubview(Cosmetics_Label)
        Cosmetics_Label.anchor(top: nil, left: view.leftAnchor, bottom: Cosmetics_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
        Cosmetics_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        scrollView.addSubview(Electronics_Button)
        Electronics_Button.anchor(top: Clothes_Button.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
        Electronics_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         
        scrollView.addSubview(Electronics_Label)
        Electronics_Label.anchor(top: nil, left: view.leftAnchor, bottom: Electronics_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
        Electronics_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        scrollView.addSubview(Footwear_Button)
        Footwear_Button.anchor(top: (Cosmetics_Button).topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
        Footwear_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                                    
        scrollView.addSubview(Footwear_Label)
        Footwear_Label.anchor(top: nil, left: view.leftAnchor, bottom: Footwear_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
        Footwear_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        scrollView.addSubview(Hardware_Button)
        Hardware_Button.anchor(top: Electronics_Button.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
        Hardware_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           
        scrollView.addSubview(Hardware_Label)
        Hardware_Label.anchor(top: nil, left: view.leftAnchor, bottom: Hardware_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
        Hardware_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                                
        scrollView.addSubview(Jewelry_Button)
        Jewelry_Button.anchor(top: (Footwear_Button).topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
        Jewelry_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                                                    
        scrollView.addSubview(Jewelry_Label)
        Jewelry_Label.anchor(top: nil, left: view.leftAnchor, bottom: Jewelry_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
        Jewelry_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                        
        scrollView.addSubview(Sporting_Goods_Button)
        Sporting_Goods_Button.anchor(top: Hardware_Button.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
        Sporting_Goods_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                           
        scrollView.addSubview(Sporting_Goods_Label)
        Sporting_Goods_Label.anchor(top: nil, left: view.leftAnchor, bottom: Sporting_Goods_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
        Sporting_Goods_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }

}



class Major_Attraction_Controller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar()
        view.addSubview(scrollView)
        setupScrollView()
        configureViewComponents()
    }

    func NavBar() {
        self.navigationItem.title = "Major Attractions | ዋና መስህብ"
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
    
    func setupScrollView(){
          
          scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
          scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    let Monument_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Monument"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Monument_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Monument_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Monument | ሐውልት"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(13)
        return label
    }()
    
    @objc func Monument_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Monument | ሐውልት"
        myVC.Business_Type =  "Monument"
        myVC.Photo_Name = "Monument"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Museum_Button: UIButton = {
          let button = UIButton()
          button.contentMode = .center
          button.setImage(#imageLiteral(resourceName: "MuseumPic"), for: UIControl.State.normal)
          button.addTarget(self, action: #selector(Museum_Result), for: .touchUpInside)
          button.imageView!.layer.cornerRadius = 5
          button.backgroundColor = .black
          button.layer.cornerRadius = 5
          return  button
      }()
      
      let Museum_Label: UILabel = {
          let label = UILabel()
          label.textAlignment = NSTextAlignment.center
          label.text = "Museum | ሙዚየም"
          label.shadowColor = .black
          label.shadowOffset = CGSize(width: 0, height: -1)
          label.textColor = .white
          label.font = label.font.withSize(13)
          return label
      }()

      
      @objc func Museum_Result() {
          let myVC = PromoOrAllLayout()
          myVC.Nav_Bar_Name = "Museum | ሙዚየም"
          myVC.Business_Type =  "Museum"
          myVC.Photo_Name = "MuseumPic"
          navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Sightseeing_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Sightseeing"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Sightseeing_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Sightseeing_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Sightseeing | መጎብኘት"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(13)
        return label
    }()
    
    @objc func Sightseeing_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Sightseeing | መጎብኘት"
        myVC.Business_Type =  "Sightseeing"
        myVC.Photo_Name = "Sightseeing"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    func configureViewComponents() {
    let screen = UIScreen.main.bounds
    let screenWidth = screen.width

    scrollView.addSubview(Monument_Button)
    Monument_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
    Monument_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                                
    scrollView.addSubview(Monument_Label)
    Monument_Label.anchor(top: nil, left: view.leftAnchor, bottom: Monument_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
    Monument_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                                
    scrollView.addSubview(Museum_Button)
    Museum_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
    Museum_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                                
    scrollView.addSubview(Museum_Label)
    Museum_Label.anchor(top: nil, left: view.leftAnchor, bottom: Museum_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
    Museum_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                                
    scrollView.addSubview(Sightseeing_Button)
    Sightseeing_Button.anchor(top: (Monument_Button).topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
    Sightseeing_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                                
    scrollView.addSubview(Sightseeing_Label)
    Sightseeing_Label.anchor(top: nil, left: view.leftAnchor, bottom: Sightseeing_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
    Sightseeing_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}


class Medical_Controller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar()
        view.addSubview(scrollView)
        setupScrollView()
        configureViewComponents()
    }
    
    func NavBar() {
        self.navigationItem.title = "Medical | ሕክምና"
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
    
    func setupScrollView(){
          
          scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
          scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    let Hospital_Button: UIButton = {
           let button = UIButton()
           button.contentMode = .center
           button.setImage(#imageLiteral(resourceName: "Hospital"), for: UIControl.State.normal)
           button.addTarget(self, action: #selector(HospitalResults), for: .touchUpInside)
           button.imageView!.layer.cornerRadius = 5
           button.backgroundColor = .black
           button.layer.cornerRadius = 5
           return  button
       }()
       
       let Hospital_Label: UILabel = {
           let label = UILabel()
           label.textAlignment = NSTextAlignment.center
           label.text = "Hospital | ሆስፒታል"
           label.shadowColor = .black
           label.shadowOffset = CGSize(width: 0, height: -1)
           label.textColor = .white
           label.font = label.font.withSize(13)
           return label
       }()
    
    @objc func HospitalResults() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Hospital | ሆስፒታል"
        myVC.Business_Type =  "Hospital"
        myVC.Photo_Name = "Hospital"
        navigationController?.pushViewController(myVC, animated: true)
    }
        
    let Pharmacy_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Pharmacy"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(PharmacyResults), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Pharmacy_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Pharmacy | መድኃኒት ቤት"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(15)
        return label
    }()
        
    @objc func PharmacyResults() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Pharmacy | መድኃኒት ቤት"
        myVC.Business_Type =  "Pharmacy"
        myVC.Photo_Name = "Pharmacy"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    func configureViewComponents() {
    let screen = UIScreen.main.bounds
    let screenWidth = screen.width
        
    scrollView.addSubview(Hospital_Button)
    Hospital_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
    Hospital_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                                
    scrollView.addSubview(Hospital_Label)
    Hospital_Label.anchor(top: nil, left: view.leftAnchor, bottom: Hospital_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
    Hospital_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                                
    scrollView.addSubview(Pharmacy_Button)
    Pharmacy_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
    Pharmacy_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                                
    scrollView.addSubview(Pharmacy_Label)
    (Pharmacy_Label).anchor(top: nil, left: view.leftAnchor, bottom: Pharmacy_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
    (Pharmacy_Label).centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
    
}



class Hair_Salon_Spa_Controller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar()
        view.addSubview(scrollView)
        setupScrollView()
        configureViewComponents()    }
    
    func NavBar() {
        self.navigationItem.title = "Hair, Salon, and Spa | የውበት ሳሎን እና ስፓ"
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
       
       func setupScrollView(){
             
             scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
             scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
             scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
             scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
       }
    
    let Barber_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Barber"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Barber_Results), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Barber_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Barber | ፀጉር አስተካካይ"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(12)
        return label
    }()
    
    @objc func Barber_Results() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Barber | ፀጉር አስተካካይ"
        myVC.Business_Type = "Barber"
        myVC.Photo_Name = "Barber"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Salon_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Salon"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Salon_Results), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Salon_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Salon | ሳሎን"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(14)
        return label
    }()
        
    @objc func Salon_Results() {
         let myVC = PromoOrAllLayout()
         myVC.Nav_Bar_Name = "Salon | ሳሎን"
         myVC.Business_Type = "Salon"
         myVC.Photo_Name = "Salon"
         navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Spa_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Spa"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Spa_Results), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Spa_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Spa | ስፓ"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(13)
        return label
    }()
        
    @objc func Spa_Results() {
          let myVC = PromoOrAllLayout()
          myVC.Nav_Bar_Name = "Spa | ስፓ"
          myVC.Business_Type = "Spa"
          myVC.Photo_Name = "Spa"
          navigationController?.pushViewController(myVC, animated: true)
    }
    
    func configureViewComponents() {
        let screen = UIScreen.main.bounds
        let screenWidth = screen.width
        scrollView.addSubview(Barber_Button)
        Barber_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
        Barber_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                                    
        scrollView.addSubview(Barber_Label)
        (Barber_Label).anchor(top: nil, left: view.leftAnchor, bottom: Barber_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
        (Barber_Label).centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                                    
        scrollView.addSubview(Salon_Button)
        Salon_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
        Salon_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                                    
        scrollView.addSubview(Salon_Label)
        Salon_Label.anchor(top: nil, left: view.leftAnchor, bottom: Salon_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
        Salon_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        scrollView.addSubview(Spa_Button)
        Spa_Button.anchor(top: (Barber_Button).topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
        Spa_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        scrollView.addSubview(Spa_Label)
        Spa_Label.anchor(top: nil, left: view.leftAnchor, bottom: Spa_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
        Spa_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}


class Other_Controller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar()
        view.addSubview(scrollView)
        setupScrollView()
        configureViewComponents()
        
    }
    
    func NavBar() {
        self.navigationItem.title = "Other | ቀሪ ነገሮች"
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
    
    func setupScrollView(){
          
          scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
          scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
  
    
   let Church_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Church"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Church_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Church_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Church | ቤተክርስቲያን"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(10)
        label.numberOfLines = 2
        return label
    }()
        
    @objc func Church_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Church | ቤተክርስቲያን"
        myVC.Business_Type = "Church"
        myVC.Photo_Name = "Church"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    let School_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "School"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(School_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let School_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "School | ትምህርት ቤት"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(13)
        return label
    }()

    @objc func School_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "School | ትምህርት ቤት"
        myVC.Business_Type = "School"
        myVC.Photo_Name = "School"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    
    
    let Other_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Splash Screen"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Other_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
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
        label.font = label.font.withSize(10)
        label.numberOfLines = 2
        return label
    }()
    
    @objc func Other_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Other | ቀሪ ነገሮች"
        myVC.Business_Type = "Other"
        myVC.Photo_Name = "Splash Screen"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    func configureViewComponents() {
                  let screen = UIScreen.main.bounds
                  let screenWidth = screen.width

                 scrollView.addSubview(Church_Button)
                 Church_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
                 Church_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
                 scrollView.addSubview(Church_Label)
                 Church_Label.anchor(top: nil, left: view.leftAnchor, bottom: Church_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
                 Church_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
                 scrollView.addSubview(School_Button)
                 School_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
                 School_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
                 scrollView.addSubview(School_Label)
                 School_Label.anchor(top: nil, left: view.leftAnchor, bottom: School_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
                 School_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
                 scrollView.addSubview(Other_Button)
                 Other_Button.anchor(top: (Church_Button).topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 105, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
                 Other_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
                 scrollView.addSubview(Other_Label)
                 Other_Label.anchor(top: nil, left: view.leftAnchor, bottom: Other_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
                 Other_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
    }
    
}


class Lodging_Controller: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar()
        view.addSubview(scrollView)
        setupScrollView()
        configureViewComponents()
        
    }
    
    func NavBar() {
        self.navigationItem.title = "Lodging | የማረፍያ ቦታ"
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
    
    func setupScrollView(){
          
          scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
          scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
          scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
  
    
   let Guest_House_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "GuestHouse"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Guest_House_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Guest_House_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Guest house | የእንግዳ ማረፊያ"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(10)
        label.numberOfLines = 2
        return label
    }()
        
    @objc func Guest_House_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Guest house | የእንግዳ ማረፊያ"
        myVC.Business_Type =  "Guest house"
        myVC.Photo_Name = "GuestHouse"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    let Hotel_Button: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.setImage(#imageLiteral(resourceName: "Hotel"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(Hotel_Result), for: .touchUpInside)
        button.imageView!.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return  button
    }()
    
    let Hotel_Label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Hotel | ሆቴል"
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0, height: -1)
        label.textColor = .white
        label.font = label.font.withSize(13)
        return label
    }()

    @objc func Hotel_Result() {
        let myVC = PromoOrAllLayout()
        myVC.Nav_Bar_Name = "Hotel | ሆቴል"
        myVC.Business_Type =  "Hotel"
        myVC.Photo_Name = "Hotel"
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    
    func configureViewComponents() {
                  let screen = UIScreen.main.bounds
                  let screenWidth = screen.width

                 scrollView.addSubview(Guest_House_Button)
                 Guest_House_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 100)
                 Guest_House_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
                 scrollView.addSubview(Guest_House_Label)
                 Guest_House_Label.anchor(top: nil, left: view.leftAnchor, bottom: Guest_House_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 5, paddingRight: screenWidth / 2 + 2.5, width: 0, height: 25)
                 Guest_House_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
                 scrollView.addSubview(Hotel_Button)
                 Hotel_Button.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: screenWidth / 2 + 2.5 , paddingBottom: 0, paddingRight: 5, width: 0, height: 100)
                 Hotel_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                 
                 scrollView.addSubview(Hotel_Label)
                 Hotel_Label.anchor(top: nil, left: view.leftAnchor, bottom: Hotel_Button.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: screenWidth / 2 + 2.5, paddingBottom: 5, paddingRight: 5, width: 0, height: 25)
                 Hotel_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}

