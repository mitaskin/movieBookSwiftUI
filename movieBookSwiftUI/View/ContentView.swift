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
        self.filmListeViewModal.filmAramasiYap(filmIsmi: "recep")
    }
    
    var body: some View {
        List(filmListeViewModal.filmler, id: \.imdbId){
            film in
            Text(film.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
