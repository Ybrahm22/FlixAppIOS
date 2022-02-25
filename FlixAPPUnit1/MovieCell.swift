//
//  MovieCell.swift
//  FlixAPPUnit1
//
//  Created by yug brahmbhatt on 2/24/22.
//

import UIKit
//Step 1: Designed Cell
//Step 2: Created cocoapods file for labels and imageView
//Step 3: Added new file name into 2 places for cell properties in main: Custom class, Reuse identifier
//Step 4: Added deque method which allowed configuration for outlets
//Steps to import podfile and alamofire
//Step 1: Package dependecy alamofire repo
//Step 2: cmd line -> pod init, open Podfile, pod install, edited podfile , pod 'AlamofireImage'

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!    
    @IBOutlet weak var posterView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
