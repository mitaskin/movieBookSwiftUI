//
//  FilmViewModal.swift
//  movieBookSwiftUI
//
//  Created by Muhammed ikbal TAŞKIN on 22.07.2023.
//

import Foundation

class FilmListeViewModal: ObservableObject{
    
    @Published var filmler = [FilmViewModal]()
    
    let downloaderClient = DownloaderClient()
    
    func filmAramasiYap(filmIsmi:String){
        downloaderClient.filmleriIndir(search: filmIsmi) { sonuc in
            switch sonuc {
                //filmDizisi Başarılı Dönerse
            case .success(let filmDizisi):
                if let filmDizisi = filmDizisi
                {
                    DispatchQueue.main.async {
                        self.filmler=filmDizisi.map(FilmViewModal.init)
                    }
                }
                //filmDizisi hata dönerse
            case .failure(let failure): print(failure)
                
            }
        }
    }
    
}


struct FilmViewModal{
    
    let film:Film
    
    var title:String{
        film.title
    }
    
    var poster:String{
        film.poster
    }
    
    var year:String{
        film.year
    }
    
    var imdbId:String{
        film.imdbId
    }
}
