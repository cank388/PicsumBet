//
//  PictureDetailViewController.swift
//  PicsumBet
//
//  Created by Kartega Mobil Dev 1 on 18.08.2022.
//

import UIKit
import Kingfisher

class PictureDetailViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var pictureModel: PicModel?
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var generalSpesificationsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let author = pictureModel?.author {
            authorLabel.text = "Author: " + author
        }
        
        if let pictureModel = pictureModel {
            generalSpesificationsLabel.text = "Width: " + pictureModel.width.description + "\n" +
                                          "Height: " + pictureModel.height.description + "\n" + 
                                            "URL: " + pictureModel.url
        }
        
        imageView.kf.setImage(with: URL(string: pictureModel?.downloadURL ?? ""))
    }
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            imageView.kf.setImage(with: URL(string: pictureModel?.downloadURL ?? ""))
        case 1:
            // imageView.kf.setImage(with: URL(string: String(pictureModel!.downloadURL + "?blur=2&grayscale")))
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(
                with: URL(string: String(pictureModel!.downloadURL + "?blur=2&grayscale")),
                placeholder: UIImage(named: "placeholderImage"),
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
            {
                result in
                switch result {
                case .success(let value):
                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                case .failure(let error):
                    print("Job failed: \(error.localizedDescription)")
                }
            }

        default:
            break
        }
        
        
    }
    
}


//- id : "102"
//- author : "Ben Moore"
//- width : 4320
//- height : 3240
//- url : "https://unsplash.com/photos/pJILiyPdrXI"
//- downloadURL : "https://picsum.photos/id/102/4320/3240"
