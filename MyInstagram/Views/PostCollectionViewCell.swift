//
//  PostCollectionViewCell.swift
//  MyInstagram
//
//  Created by Whitney Griffith on 9/24/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//


import UIKit
import Parse
import ParseUI

class PostCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!

    @IBOutlet weak var postImageView: PFImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var likesImage: UIImageView!
    
    @IBOutlet weak var commentImage: UIImageView!
    
    
    @IBOutlet weak var numberLikesLabel: UILabel!
    
    @IBOutlet weak var usernameCaptionLabel: UILabel!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    var newPost: Post! {
        didSet {
            
           self.postImageView!.file = newPost.media
           self.postImageView.loadInBackground()
           
           self.usernameLabel.text = newPost.author.username
           self.usernameCaptionLabel.text = newPost.author.username
           
           self.numberLikesLabel.text = String(newPost.likesCount)
           self.captionLabel.text = newPost.caption
            
           /*
             
             TODO:
             locationLabel
             profileImageView
             likesImage
             commentImage
             
           */


        }
    }
    
}
