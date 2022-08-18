//
//  HomepageCollectionViewCell.swift
//  PicsumBet
//
//  Created by Kartega Mobil Dev 1 on 18.08.2022.
//

import UIKit
import Kingfisher

class HomepageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func willDisplay(imageUrl: String?) {
        // Change the width and height to load faster
        var finalUrl = ""
        if let url = imageUrl {
            let finalArray = url.components(separatedBy: "/")
            for i in 0..<finalArray.count - 2 {
                finalUrl += finalArray[i] + "/"
                if i == finalArray.count - 3 {
                    finalUrl += "300/200"
                }
            }
        }
        imageView.kf.setImage(with: URL(string: finalUrl))
    }
    

}
