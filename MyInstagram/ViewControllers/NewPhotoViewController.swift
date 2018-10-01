//
//  NewPhotoViewController.swift
//  MyInstagram
//
//  Created by Whitney Griffith on 9/30/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//

import UIKit

class NewPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var caption: UITextField!

    @IBOutlet weak var newPhoto: UIImageView!
    
    var vc = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vc.delegate = self
        vc.allowsEditing = true
    }
    
    @IBAction func openCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            self.vc.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            self.vc.sourceType = .photoLibrary
        }
        self.present(vc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    

    

    
    
    private func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let newImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        newPhoto.image = newImage
    
        dismiss(animated: true, completion: nil)
    }

    @IBAction func postToFeed(_ sender: Any) {
        if (newPhoto.image != nil) {
            Post.postUserImage(image: newPhoto.image, withCaption: caption.text, withCompletion: nil)
            _ = navigationController?.popViewController(animated: true)
        }
    }
    



}
