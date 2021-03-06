//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Mykhailo Ivaniuk on 10/9/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    
    @IBOutlet weak var retweetButton1: UIButton!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var favorited: Bool = false
    var tweetId: Int = -1
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweetTweet(tweetId: tweetId, success: {self.setRetweeted(true)}, failure: { (error) in
                                                print("Retweet did not succeed: \(error)")})
    }
   
    func setRetweeted(_ isRetweeted: Bool){
        if (isRetweeted){
            retweetButton1.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
            //retweetButton1.isEnabled = false
        } else{
            retweetButton1.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
            //retweetButton1.isEnabled = true
        }
    }
    @IBAction func favoriteTweet(_ sender: Any) {
        let tobeFavorited = !favorited
        if (tobeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {self.setFavorite(true)}, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        } else{
            TwitterAPICaller.client?.unFavoriteTweet(tweetId: tweetId, success: {self.setFavorite(false)}, failure: { (error) in
                                                        print("Unfavorite did not succeed: \(error)")})
            
        }
    }
    
    func setFavorite(_ isFavorited: Bool){
        favorited = isFavorited
        if (favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        } else {
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
}
