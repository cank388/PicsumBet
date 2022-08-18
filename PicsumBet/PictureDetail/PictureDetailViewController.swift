//
//  PictureDetailViewController.swift
//  PicsumBet
//
//  Created by Kartega Mobil Dev 1 on 18.08.2022.
//

import UIKit

class PictureDetailViewController: UIViewController {
    
    var viewModel = PictureDetailViewModel()
    var pictureModel: PictureModel?
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var generalSpesificationsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViews()
    }
    
    func loadViews() {
        if let pictureModel = pictureModel {
            viewModel.setAuthorLabel(label: authorLabel, pictureModel: pictureModel.author)
            viewModel.setGeneralSpesificationLabel(label: generalSpesificationsLabel, pictureModel: pictureModel)
            viewModel.setImageView(imageView: imageView, url: pictureModel.downloadURL)
        }
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            viewModel.setImageView(imageView: imageView, url: String(pictureModel?.downloadURL ?? ""))
        case 1:
            viewModel.convertImageToBlur(imageView: imageView, url: pictureModel?.downloadURL ?? "")
        default:
            break
        }
    }
    
}
