//
//  HomepageViewController.swift
//  PicsumBet
//
//  Created by Kartega Mobil Dev 1 on 18.08.2022.
//

import UIKit

class HomepageViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel = HomepageViewModel()
    var homeModel: [PicModel]?
    var pageNumber = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "HomepageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomepageCollectionViewCell")
        viewModel.getPictureList(page: pageNumber) { [self] result in
            switch result {
                case .failure(_):
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                case .success(let data):
                    homeModel = data
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
            }
        }
    }
    
    
}

extension HomepageViewController:  UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomepageCollectionViewCell", for: indexPath) as! HomepageCollectionViewCell
        cell.willDisplay(imageUrl: homeModel?[indexPath.row].downloadURL)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            let currentPage = collectionView.contentOffset.y / collectionView.frame.size.width;
            if indexPath.row * 2 == homeModel?.count ?? 0 / 2 {
                pageNumber += 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    self.viewModel.getPictureList(page: self.pageNumber) { [self] result in
                        switch result {
                            case .failure(_):
                                DispatchQueue.main.async {
                                    self.collectionView.reloadData()
                                }
                            case .success(let data):
                                homeModel! += data
                                DispatchQueue.main.async {
                                    self.collectionView.reloadData()
                                }
                        }
                    }
                }
            }
            
    }
    
}

extension HomepageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let leftAndRightPaddings: CGFloat = 15
            let numberOfItemsPerRow: CGFloat = 2.0

            let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
            return CGSize(width: width, height: width) // You can change width and height here as pr your requirement

        }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 200.0, height: 200.0)
//    }

}
