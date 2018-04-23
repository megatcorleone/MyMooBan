//
//  ProfileImageViewController.swift
//  MyMooBan
//
//  Created by Globaltium on 18/04/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit

class ProfileImageViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBAction func takePhoto(_ sender: Any) {
        let image1 = UIImagePickerController()
        image1.delegate = self
        image1.sourceType = UIImagePickerControllerSourceType.camera
        image1.allowsEditing = true
        self.present(image1, animated: true)
        
    }
    
    @IBAction func photoGallery(_ sender: Any) {
        let image2 = UIImagePickerController()
        image2.delegate = self
        image2.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image2.allowsEditing = false
        self.present(image2, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 1.0
        profileImage.layer.borderColor = UIColor.white.cgColor
        
    }

    //MARK: UIImagePickerControllerDelegate Starts
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        profileImage.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
        
        
        //Camera simulator malfunction-----------------------------------
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            
            let alertController = UIAlertController.init(title: nil, message: "Device has no camera.", preferredStyle: .alert)
            
            let okAction = UIAlertAction.init(title: "Alright", style: .default, handler: {(alert: UIAlertAction!) in
            })
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        else{
            //other action
        }
        
        //Camera simulator malfunction------------------------------------
    }
    
    //MARK: UIImagePickerControllerDelegate Ends
    

   

}
