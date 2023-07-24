//
//  ContentView.swift
//  movieBookSwiftUI
//
//  Created by Muhammed ikbal TAŞKIN on 21.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var filmListeViewModal : FilmListeViewModal
    
    init() {
        self.filmListeViewModal = FilmListeViewModal()
        self.filmListeViewModal.filmAramasiYap(filmIsmi: "gora")
    }
    
    var body: some View {
        NavigationView{
            
            List(filmListeViewModal.filmler, id: \.imdbId){
                film in
                HStack{
                    
                    OzelImage(url: film.poster).frame(width: 70, height: 110)
                    
                    VStack(alignment: .leading){
                        Text(film.title).font(.title3).foregroundColor(.blue)
                        Text(film.year).font(.title2).foregroundColor(.orange)
                    }
                }
            }.navigationTitle(Text("Film Arşivi"))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
