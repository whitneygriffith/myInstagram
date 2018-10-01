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

class HomeViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var posts : [Post] = []
    var refresh: UIRefreshControl!
    var cellIndex: Int!
    
    @IBAction func didTap(sender: UITapGestureRecognizer) {
       // let location = sender.location(in: view)
        self.cellIndex = sender.view!.tag
        performSegue(withIdentifier:"ShowPostInfo", sender: self)
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedsPost", for: indexPath ) as! PostCollectionViewCell
        
         let post = self.posts[indexPath.row]
        
        
        cell.newPost = post
        

        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(sender:)))
        // Optionally set the number of required taps, e.g., 2 for a double click
        tapGestureRecognizer.numberOfTapsRequired = 1
        
        cell.postImageView.tag = indexPath.row
        cell.postImageView.isUserInteractionEnabled = true
    cell.postImageView.addGestureRecognizer(tapGestureRecognizer)
        
        return cell
    }
    
    
    @IBAction func logoutButton(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("UserDidLogOut"), object: nil)
    }
    
    @IBOutlet weak var FeedsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector (HomeViewController.didPullToRefresh(_:)), for: .valueChanged)
        
        collectionView.dataSource = self
        self.collectionView.reloadData()
        returnPosts()

        // Do any additional setup after loading the view.
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.returnPosts()
        }
        
        
    }
    
    func returnPosts(){
        let query = PFQuery(className: "Post")
        query.limit = 20
        query.addDescendingOrder("createdAt")
        query.includeKey("author")
        query.includeKey("createdAt")
        query.findObjectsInBackground(block:{ (allPosts: [PFObject]?, error: Error?) -> Void in
            if let getPosts = allPosts{
                self.posts = getPosts as! [Post]
            }
            else{
                print(error!.localizedDescription)
            }
            self.collectionView.reloadData()
        })
        self.refresh.endRefreshing()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is DetailPostViewController
        {
            let vc = segue.destination as! DetailPostViewController
            let post = posts[self.cellIndex]
            vc.caption = post.caption
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let string = formatter.string(from: post.createdAt!)
            vc.timestamp = string
        }
    }
    
    
    

}

