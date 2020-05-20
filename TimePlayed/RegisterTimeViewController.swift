//
//  ViewController.swift
//  TimePlayed
//
//  Created by Fernando Castor on 14/04/20.
//  Copyright © 2020 Fernando Castor. All rights reserved.
//

import UIKit
import Photos

class RegisterTimeViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  // Three different types of constraints.
  //  private var compactConstraints: [NSLayoutConstraint] = []
  //private var regularConstraints: [NSLayoutConstraint] = []
  //private var sharedConstraints: [NSLayoutConstraint] = []
  
  var gameImage:UIImageView?
  let  selectImage = UILabel()
  
  let IDEAL_IMAGE_WIDTH:CGFloat = 333
  let IDEAL_IMAGE_HEIGHT:CGFloat = 265
  
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
    gameImage = UIImageView(frame: CGRect(x: 5, y: 5, width: width - 10, height: height - 10))
    gameImage?.translatesAutoresizingMaskIntoConstraints = false
    gameImage?.contentMode = .scaleAspectFit
    gameImage?.image = UIImage(named: "imageSelectionBorder")
    gameImage?.backgroundColor = UIColor(red: 1, green: 100/255, blue: 100/255, alpha:1.0)
    
    gameImage?.isUserInteractionEnabled = true
    gameImage?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openGameImage)))
    
    selectImage.text = "Select an Image"
    selectImage.translatesAutoresizingMaskIntoConstraints = false
    selectImage.textColor = .white
    selectImage.font = selectImage.font.withSize(28)
    
    let logTime  = UIButton()
    logTime.titleEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 15, right: 10)
    logTime.setTitle("Log Time", for: .normal)
    logTime.translatesAutoresizingMaskIntoConstraints = false
    logTime.layer.borderWidth = 1.0
    logTime.layer.cornerRadius = 5.0
    logTime.backgroundColor = .clear
    logTime.layer.borderColor = UIColor.black.cgColor
    logTime.titleLabel?.sizeToFit()
    
    
    
    self.view.addSubview(date)
    self.view.addSubview(gameName)
    self.view.addSubview(timePlayed)
    self.view.addSubview(gameImage!)
    self.view.addSubview(selectImage)
    self.view.bringSubviewToFront(selectImage)
    self.view.addSubview(logTime)
    
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
    
    gameImage!.topAnchor.constraint(equalTo: timePlayed.bottomAnchor).isActive = true
    gameImage!.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    gameImage!.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    
    selectImage.centerYAnchor.constraint(equalTo: gameImage!.centerYAnchor).isActive = true
    selectImage.centerXAnchor.constraint(equalTo: gameImage!.centerXAnchor).isActive = true
    
    logTime.topAnchor.constraint(equalTo: gameImage!.bottomAnchor).isActive = true
    
  }
  
  
  // Resizes an image based on its height. Attempts to resize the
  // width proportionally unless it is greater than maxWidth. In this
  // case, uses maxWidth and breaks the proportions.
  func resizeImage(image: UIImage, height: CGFloat, maxWidth: CGFloat) -> UIImage {
    let newWidth = min((height * image.size.width)/image.size.height, maxWidth)
    
    let newSize = CGSize(width: newWidth, height: height)
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
  }
  
  @objc private func openGameImage(_ recognizer: UITapGestureRecognizer) {
    // In order to access the photo library, we need permissions. Set them up at info.plist.
    // Privacy - Photo Library Usage Description
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
      let imagePickerController = UIImagePickerController()
      imagePickerController.delegate = self
      imagePickerController.sourceType = .photoLibrary
      self.present(imagePickerController, animated: true, completion: nil)
    }
    print("tapped!")
  }
  
  // Called when the image is selected.
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    // self from dismiss's context.
    guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
    
    let width:CGFloat = self.gameImage!.frame.width
    let height:CGFloat = self.gameImage!.frame.height
    print(width)
    print(height)
    
    self.gameImage!.image = resizeImage(image: image, height: IDEAL_IMAGE_HEIGHT, maxWidth: IDEAL_IMAGE_WIDTH)
    
    
    self.selectImage.isHidden = true
    picker.dismiss(animated: true, completion: nil)
  }
  
  // Required by UIImagePickerViewDelegate. Dismisses the picker
  // without selecting any images.
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  // Function to remove the keyboard once the user touches return
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
    
  }
  
}

