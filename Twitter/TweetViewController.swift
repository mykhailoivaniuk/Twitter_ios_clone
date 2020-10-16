//
//  TweetViewController.swift
//  Twitter
//
//  Created by Mykhailo Ivaniuk on 10/16/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tweetLabel: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetLabel.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tweetPost(_ sender: Any) {
        if (!tweetLabel.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetLabel.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure:{
                (error) in print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        }else{
            self.dismiss(animated: true, completion: nil)
            
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
