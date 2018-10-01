//
//  DetailPostViewController.swift
//  MyInstagram
//
//  Created by Whitney Griffith on 9/30/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//

import UIKit

class DetailPostViewController: UIViewController {

    @IBOutlet weak var timeStampLabel: UILabel!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    var caption: String!
    
    var timestamp: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timeStampLabel.text = timestamp
        captionLabel.text = caption
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
