//
//  ViewController.swift
//  TimePlayed
//
//  Created by Fernando Castor on 14/04/20.
//  Copyright © 2020 Fernando Castor. All rights reserved.
//

import UIKit

class RegisterTimeViewController: UIViewController, UITextFieldDelegate {
  
  // Three different types of constraints.
  //  private var compactConstraints: [NSLayoutConstraint] = []
  //private var regularConstraints: [NSLayoutConstraint] = []
  //private var sharedConstraints: [NSLayoutConstraint] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let gameName = UITextField()
    // To use autolayout, this property must be set to false.
    gameName.translatesAutoresizingMaskIntoConstraints = false
    gameName.placeholder = "Name of the game"
    gameName.backgroundColor = UIColor(red: 255/255.0, green: 100/255.0, blue: 100/255.0, alpha: 1.0)
    gameName.textColor = UIColor.white
    gameName.delegate = self
    gameName.font = gameName.font?.withSize(28)
    
    // Adding some extra space to the left.
    let spacerView = UIView(frame:CGRect(x:0, y:0, width:15, height:10))
    gameName.leftViewMode = UITextField.ViewMode.always
    gameName.leftView = spacerView
    //  print(UIFont.familyNames)
    //  print(UIFont.fontNames(forFamilyName: "Helvetica"))
    //  print(UIFont.fontNames(forFamilyName: "Rockwell"))
    
    let date = UIDatePicker()
    date.translatesAutoresizingMaskIntoConstraints = false
    
    // Cumbersome way to change the text color for a datePicker
    date.setValue(UIColor.white, forKey: "textColor")
    //    date.setValue(true, forKey: "highlightsToday")
    date.datePickerMode = .date
    
    let timePlayed = UIDatePicker()
    timePlayed.datePickerMode = .countDownTimer
    timePlayed.setValue(UIColor.white, forKey: "textColor")
    timePlayed.translatesAutoresizingMaskIntoConstraints = false
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height/3
    let gameImage = UIImageView(frame: CGRect(x: 5, y: 5, width: width - 10, height: height - 10))
    gameImage.translatesAutoresizingMaskIntoConstraints = false
    gameImage.contentMode = .scaleAspectFit
    gameImage.image = UIImage(named: "imageSelectionBorder")
    gameImage.backgroundColor = UIColor(red: 1, green: 100/255, blue: 100/255, alpha:1.0)
    
    gameImage.isUserInteractionEnabled = true
    gameImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openGameImage)))

    let  selectImage = UILabel()
    selectImage.text = "Select an Image"
    selectImage.translatesAutoresizingMaskIntoConstraints = false
    selectImage.textColor = .white
    selectImage.font = selectImage.font.withSize(28)
    
    self.view.addSubview(date)
    self.view.addSubview(gameName)
    self.view.addSubview(timePlayed)
    self.view.addSubview(gameImage)
    self.view.addSubview(selectImage)
    self.view.bringSubviewToFront(selectImage)
    
    // Setting Autolayout Constraints
    // This first constraint must set the top anchor of the first component to the equal
    // to the top anchor of the safe area. If we just make it equal to the top anchor
    // of the parent view, the former will invade the topmost area of the screen.
    date.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
    date.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    //    date.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
    date.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
    date.heightAnchor.constraint(equalToConstant: view.frame.height/8).isActive = true
    
    gameName.topAnchor.constraint(equalTo: date.bottomAnchor).isActive = true
    gameName.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    gameName.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    gameName.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
    gameName.heightAnchor.constraint(equalToConstant: self.view.frame.height/8).isActive = true
    
    timePlayed.topAnchor.constraint(equalTo: gameName.bottomAnchor).isActive = true
    timePlayed.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    timePlayed.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    timePlayed.heightAnchor.constraint(equalToConstant: view.frame.height/8).isActive = true
    
    gameImage.topAnchor.constraint(equalTo: timePlayed.bottomAnchor).isActive = true
    gameImage.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    gameImage.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
    selectImage.centerYAnchor.constraint(equalTo: gameImage.centerYAnchor).isActive = true
    selectImage.centerXAnchor.constraint(equalTo: gameImage.centerXAnchor).isActive = true
    //    selectImage.topAnchor.constraint(equalTo: gameImage.topAnchor).isActive = true
    //    selectImage.heightAnchor.constraint(equalToConstant: gameImage.bounds.height/2).isActive = true
  }
  
  @objc private func openGameImage(_ recognizer: UITapGestureRecognizer) {
    print("tapped!")
    
    // Check this, maybe: https://stackoverflow.com/questions/52399079/accessing-the-camera-and-photo-library-in-swift-4
    
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
    
  }
}

