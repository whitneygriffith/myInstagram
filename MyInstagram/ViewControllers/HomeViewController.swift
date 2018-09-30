//
//  HomeViewController.swift
//  MyInstagram
//
//  Created by Whitney Griffith on 9/23/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//

import UIKit

import Parse
import ParseUI

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
   // var posts : [Post] = []
    var raw_posts: [PFObject] = []
    
    @IBAction func logoutButton(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("UserDidLogOut"), object: nil)
    }
    
    @IBOutlet weak var FeedsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
