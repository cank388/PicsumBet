//
//  PictureDetailViewModel.swift
//  PicsumBet
//
//  Created by Kartega Mobil Dev 1 on 18.08.2022.
//

import UIKit
import Kingfisher

class PictureDetailViewModel {
    
    func convertImageToBlur(imageView: UIImageView, url: String) {
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: URL(string: String(url + "?blur=2&grayscale")),
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
//            switch result {
//            case .success(_):
//                // We can send data to firebase here
//            case .failure(_):
               // We can send data to firebase here
//            }
        }
    }
    
    func setGeneralSpesificationLabel(label: UILabel, pictureModel: PictureModel) {
        label.text = "Width: " + pictureModel.width.description + "\n" +
                                      "Height: " + pictureModel.height.description + "\n" +
                                        "URL: " + pictureModel.url

    }
    
    func setAuthorLabel(label: UILabel, pictureModel: String) {
        label.text = "Author: " + pictureModel
    }
    
    func setImageView(imageView: UIImageView, url: String) {
        imageView.kf.setImage(with: URL(string: url))
    }
    
}
