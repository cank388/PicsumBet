//
//  HomepageViewController.swift
//  PicsumBet
//
//  Created by Kartega Mobil Dev 1 on 18.08.2022.
//

import UIKit

class HomepageViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "HomepageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomepageCollectionViewCell")
    }
    
    
}

extension HomepageViewController:  UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomepageCollectionViewCell", for: indexPath) as! HomepageCollectionViewCell
        return cell
    }
    
    
}
