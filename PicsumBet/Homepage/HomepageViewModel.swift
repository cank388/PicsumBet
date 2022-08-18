//
//  HomepageViewModel.swift
//  PicsumBet
//
//  Created by Kartega Mobil Dev 1 on 18.08.2022.
//

import UIKit

class HomepageViewModel {
    
    var postData:PictureModel?
    var pageNumber = 1

    func getPictureList(page: Int, completion : @escaping (Result<[PictureModel], Error>) -> (Void)) {
        let url = URL(string: "https://picsum.photos/v2/list?page=\(page)&limit=16")!
        URLSession.shared.dataTask(with: url) { [weak self] (data, urlResponse, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, data.isEmpty == false else {
                completion(.failure(error?.localizedDescription as! Error))
                return
            }
            
            do {
                let resources = try JSONDecoder().decode([PictureModel].self, from: data)
                completion(.success(resources))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    
}
