//
//  PostCollectionViewCell.swift
//  MyInstagram
//
//  Created by Whitney Griffith on 9/24/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//

import UIKit
import Parse

class PostCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var likeImage: UIImageView!
    
    @IBOutlet weak var commentImage: UIImageView!
    
    @IBOutlet weak var shareImage: UIImageView!
    
    
    @IBOutlet weak var numberLikesLabel: UILabel!
    
    @IBOutlet weak var usernameCaptionLabel: UILabel!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    var post: PFObject! {
        didSet {
            //profileImageView.file = post["media"] as? PFFile
            //profileImageView.loadInBackground()
            
            usernameLabel.text = (post["author"] as? PFUser)?.username
            locationLabel.text = post["location"] as? String
            
            //postImageView.file = post["media"] as? PFFile
            //self.postImageView.loadInBackground()
            
            likeImage.image =  #imageLiteral(resourceName: "favor-icon")
            commentImage.image = #imageLiteral(resourceName: "comment-icon")
            shareImage.image = #imageLiteral(resourceName: "offline-save-icon")
            
            
            numberLikesLabel.text = post["likesCount"] as? String
            captionLabel.text = post["caption"] as? String
        }
    }
    
}
