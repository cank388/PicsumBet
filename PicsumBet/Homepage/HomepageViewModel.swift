//
//  HomepageViewModel.swift
//  PicsumBet
//
//  Created by Kartega Mobil Dev 1 on 18.08.2022.
//

import UIKit

class HomepageViewModel {
    
    var postData:PicModel?

    func getPictureList(page: Int, completion : @escaping (Result<[PicModel], Error>) -> (Void)) {
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
                let resources = try JSONDecoder().decode([PicModel].self, from: data)
                completion(.success(resources))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    
}


struct PicModel: Codable {
    let id, author: String
    let width, height: Int
    let url, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}
