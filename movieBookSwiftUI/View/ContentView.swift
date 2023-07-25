//
//  ContentView.swift
//  movieBookSwiftUI
//
//  Created by Muhammed ikbal TAŞKIN on 21.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var filmListeViewModal : FilmListeViewModal
    
    @State var aranacakFilm = ""
    
    init() {
        self.filmListeViewModal = FilmListeViewModal()
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
                TextField("Aramak istediğiniz film",
                          text: $aranacakFilm,
                          onEditingChanged: { _ in},
                          onCommit: {
                    self.filmListeViewModal.filmAramasiYap(
                        filmIsmi: aranacakFilm
                            .trimmingCharacters(in: .whitespacesAndNewlines)
                            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
                        ?? aranacakFilm)
                }).padding().textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                List(filmListeViewModal.filmler, id: \.imdbId){
                    film in
                    NavigationLink(destination: DetayView(imdbId:film.imdbId),
                        label: {
                            HStack{
                                OzelImage(url: film.poster).frame(width: 70, height: 110)
                                VStack(alignment: .leading){
                                    Text(film.title).font(.title3).foregroundColor(.blue)
                                    Text(film.year).font(.title2).foregroundColor(.orange)
                                }
                            }
                        }
                    )
                }.navigationTitle(Text("Film Arşivi"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
