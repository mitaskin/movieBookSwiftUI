//
//  DownloaderClient.swift
//  movieBookSwiftUI
//
//  Created by Muhammed ikbal TAŞKIN on 21.07.2023.
//

import Foundation

class DownloaderClient {
    
    func filmleriIndir(search : String, completion: @escaping (Result<[Film]?,DowloaderError>) -> Void)
    {
        
        guard let url = URL(string:"https://www.omdbapi.com/?s=\(search)&apikey=befa1d0e") else
        {
            return completion(.failure(.yanlisUrl))
        }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else
            {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let filmCevabi = try? JSONDecoder().decode(GelenFilmler.self, from: data) else
            {
                return completion(.failure(.veriIslenemedi))
            }
            
            completion(.success(filmCevabi.filmler))
            
        }.resume()
    }
    
}

enum DowloaderError : Error{
    case yanlisUrl
    case veriGelmedi
    case veriIslenemedi
}
