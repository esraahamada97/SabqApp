//
//  ProfileViewController.swift
//  SabqApp
//
//  Created by user on 11/24/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseFirestore
class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var db: Firestore!
   let placeHolderProfileImage = #imageLiteral(resourceName: "img_user")
     let placeHolderCoverImage = #imageLiteral(resourceName: "placeholder-1")
    var imagePicker = UIImagePickerController()
    var imagePicked = 0
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       userImageView.layer.masksToBounds = true
        userImageView.layer.borderWidth = 5.0
       userImageView.layer.borderColor = UIColor.white.cgColor
      userImageView.layer.cornerRadius = userImageView.bounds.width / 2
     let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapDetected(_:)))
        singleTap.view?.tag = 1
     userImageView.isUserInteractionEnabled = true
     userImageView.addGestureRecognizer(singleTap)
        let singleCoverPhotoTap = UITapGestureRecognizer(target: self, action: #selector(tapDetectedCoverPhoto(_:)))
        singleCoverPhotoTap.view?.tag = 2
           coverImageView.isUserInteractionEnabled = true
         coverImageView.addGestureRecognizer(singleCoverPhotoTap)
          imagePicker.delegate = self
         db = Firestore.firestore()
        let ref = db.collection("Profiles").document("Profiles")
        ref.getDocument { (snapshot, err) in
            if let data = snapshot?.data() {
                print(data["name"] as Any)
                self.nameLabel.text = data["name"] as Any as? String
                self.emailLabel.text = data["email"] as Any as? String
                
                let profileImageURL = data["profileImage"] as Any as! String
                 let coverImageURL = data["coverImage"] as Any as! String
                if let profileApiUrl: URL = URL(string: profileImageURL ) {

                    self.userImageView.sd_setImage(with: profileApiUrl, placeholderImage: self.placeHolderProfileImage)
                    self.userImageView.contentMode = .scaleToFill
                 } else {
                    self.userImageView.image = self.placeHolderProfileImage
                 }
                
                if let coverApiUrl: URL = URL(string: coverImageURL ) {
                  
                   self.coverImageView.sd_setImage(with: coverApiUrl, placeholderImage: self.placeHolderCoverImage)
                    self.coverImageView.contentMode = .scaleToFill
                } else {
                   self.userImageView.image = self.placeHolderCoverImage
                }
               

                
            } else {
                print("Couldn't find the document")
            }
        }
       
    }
    
  override func viewDidLayoutSubviews() {
      coverImageView.roundCorners(cornerRadius: 38.0)
  }

    func photoFromLibrary() {
           imagePicker.allowsEditing = true
           imagePicker.sourceType = .photoLibrary
          imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            imagePicker.modalPresentationStyle = .popover
           present( imagePicker, animated: true, completion: nil)
          
       }
        
       func shootPhoto() {
           if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.cameraCaptureMode = .photo
                imagePicker.modalPresentationStyle = .fullScreen
               present( imagePicker,animated: true,completion: nil)
           } else {
               noCamera()
           }
       }
       func noCamera(){
           let alertVC = UIAlertController(
               title: "No Camera",
               message: "Sorry, this device has no camera",
               preferredStyle: .alert)
           let okAction = UIAlertAction(
               title: "OK",
               style:.default,
               handler: nil)
           alertVC.addAction(okAction)
           present(
               alertVC,
               animated: true,
               completion: nil)
       }
    
    @objc func tapDetected(_ sender: UITapGestureRecognizer) {
        let tag = sender.view?.tag
        imagePicked = 1
        print("Imageview Clicked")
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            let alertVC = UIAlertController(
                          title: "gallary or camera",
                          message: "choose camera or gallary",
                          preferredStyle: .alert)
                      let gallaryAction = UIAlertAction(
                          title: "Gallary",
                          style:.default,
                         handler: { (action) -> Void in
                              // Get 1st TextField's text
                             self.photoFromLibrary()
                          })
            let cameraAction = UIAlertAction(
                                     title: "Camera",
                                     style:.default,
                                     handler: { (action) -> Void in
                                         // Get 1st TextField's text
                                        self.shootPhoto()
                                     })
                      alertVC.addAction(gallaryAction)
            alertVC.addAction(cameraAction)
                      present(
                          alertVC,
                          animated: true,
                          completion: nil)
         
          
        }
    }
    
    @objc func tapDetectedCoverPhoto(_ sender: UITapGestureRecognizer) {
          let tag = sender.view?.tag
        imagePicked = 2
           print("Imageview Clicked")
           if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
               print("Button capture")
               let alertVC = UIAlertController(
                             title: "gallary or camera",
                             message: "choose camera or gallary",
                             preferredStyle: .alert)
                         let gallaryAction = UIAlertAction(
                             title: "Gallary",
                             style:.default,
                            handler: { (action) -> Void in
                                 // Get 1st TextField's text
                                self.photoFromLibrary()
                             })
               let cameraAction = UIAlertAction(
                                        title: "Camera",
                                        style:.default,
                                        handler: { (action) -> Void in
                                            // Get 1st TextField's text
                                           self.shootPhoto()
                                        })
                         alertVC.addAction(gallaryAction)
               alertVC.addAction(cameraAction)
                         present(
                             alertVC,
                             animated: true,
                             completion: nil)
            
             
           }
       }
       
       
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if imagePicked == 1 {
            if let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
                   {
                      userImageView.contentMode = .scaleToFill
                       userImageView.image = img
                       uploadImage(pickedImage: img)
                      

                   }
                   else if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
                   {
                     userImageView.contentMode = .scaleToFill
                       userImageView.image = img
                       uploadImage(pickedImage: img)
                      

                   }
                   
             
               }
            else if imagePicked == 2
                   {
                      if let imgCover = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
                      {
                         coverImageView.contentMode = .scaleToFill
                           coverImageView.image = imgCover
                          uploadCoverImage(pickedImage: imgCover)
                         

                      }
                      else if let imgCover = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
                      {
                        coverImageView.contentMode = .scaleToFill
                         coverImageView.image = imgCover
                        uploadCoverImage(pickedImage: imgCover)
                         

                      }
                   }
        
       
        
        

     
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
       dismiss(animated: true, completion: nil)
    }
    func uploadImage(pickedImage:UIImage)  {
        let imageName = NSUUID().uuidString
                         let StorageRef = Storage.storage().reference().child("Profiles").child(imageName)
                   print(imageName)
                   
               
        guard let imageData = pickedImage.jpegData(compressionQuality: 0.1) else {
                      fatalError("nodata")
                   }
                   
                   StorageRef.putData(imageData, metadata: nil) { (metadata, err) in
                       if let error = err {print("no data ")
                           return
                           
                       }
                       
                       StorageRef.downloadURL(completion: {(url, err) in
                           if let error = err {print("no data ")
                               return
                               
                           }
                           
                           guard let url = url  else {print("no data ")
                               return
                               }
                           print(url.absoluteString)
                           
                           let ref = Firestore.firestore().collection("Profiles").document("Profiles")
                           let documentId = ref.documentID
                           let urlString = url.absoluteString
                           ref.updateData(["profileImage" : urlString]) { (err) in
                               if let error = err {print("no data ")
                                   return
                                   
                               }
                               print("successufully updated")
                           }
                           
                       })
                   }
                
              
                 
                    
                   
        
    }
    
    
    func uploadCoverImage(pickedImage:UIImage)  {
        let imageName = NSUUID().uuidString
                         let StorageRef = Storage.storage().reference().child("Profiles").child(imageName)
                   print(imageName)
                   
               
        guard let imageData = pickedImage.jpegData(compressionQuality: 0.1) else {
                      fatalError("nodata")
                   }
                   
                   StorageRef.putData(imageData, metadata: nil) { (metadata, err) in
                       if let error = err {print("no data ")
                           return
                           
                       }
                       
                       StorageRef.downloadURL(completion: {(url, err) in
                           if let error = err {print("no data ")
                               return
                               
                           }
                           
                           guard let url = url  else {print("no data ")
                               return
                               }
                           print(url.absoluteString)
                           
                           let ref = Firestore.firestore().collection("Profiles").document("Profiles")
                           let documentId = ref.documentID
                           let urlString = url.absoluteString
                           ref.updateData([ "coverImage" : urlString]) { (err) in
                               if let error = err {print("no data ")
                                   return
                                   
                               }
                               print("successufully updated")
                           }
                           
                       })
                   }
                
              
                 
                    
                   
        
    }
   
}

extension UIView {
func roundCorners(cornerRadius: Double) {
      self.layer.cornerRadius = CGFloat(cornerRadius)
      self.clipsToBounds = true
      self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
  }
}
