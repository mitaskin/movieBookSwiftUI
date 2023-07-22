//
//  FilmViewModal.swift
//  movieBookSwiftUI
//
//  Created by Muhammed ikbal TAŞKIN on 22.07.2023.
//

import Foundation

class FilmListeViewModal: ObservableObject{
    
    @Published var filmler = [Film]()
    
    let downloaderClient = DownloaderClient()
    
    func filmAramasiYap(filmIsmi:String){
        downloaderClient.filmleriIndir(search: filmIsmi) { sonuc in
            switch sonuc {
            //filmDizisi Başarılı Dönerse
            case .success(let filmDizisi):
                if let filmDizisi = filmDizisi
                {
                    self.filmler=filmDizisi
                }
            //filmDizisi hata dönerse
            case .failure(let failure): print(failure)
                
            }
        }
    }
    
}
