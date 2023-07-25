//
//  FilmDetayViewModal.swift
//  movieBookSwiftUI
//
//  Created by Muhammed ikbal TAŞKIN on 25.07.2023.
//

import Foundation
import SwiftUI

class FilmDetayViewModal : ObservableObject {
    @Published var filmDetayi : FilmDetaylariViewModal?
    
    let downloaderClient = DownloaderClient()
    
    func filmDetayiAl(imdbId:String){
        
        downloaderClient.filmDetayiniIndir(imdbId: imdbId) { (sonuc) in
            switch(sonuc)
            {
            case .failure(let hata):
                print(hata)
            case .success(let filmDetay):
                self.filmDetayi = FilmDetaylariViewModal(detay: filmDetay)
            }
        }
        
    }
    
}

struct FilmDetaylariViewModal{
    
    let detay : FilmDetay
    
    var title : String{
        detay.title
    }
    
    var poster : String{
        detay.poster
    }
    
    var year : String{
        detay.year
    }
    
    var imdbId : String{
        detay.imdbId
    }
    
    var director : String{
        detay.director
    }
    
    var writer : String{
        detay.writer
    }
    
    var awards : String{
        detay.awards
    }
    
    var plot : String{
        detay.plot
    }
    
}
