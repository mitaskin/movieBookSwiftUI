//
//  DetayView.swift
//  movieBookSwiftUI
//
//  Created by Muhammed ikbal TAŞKIN on 25.07.2023.
//

import SwiftUI

struct DetayView: View {
    
    let imdbId:String
    
    @ObservedObject var filmDetayViewModal = FilmDetayViewModal()
    
    var body: some View {
        VStack{
            
            OzelImage(url: filmDetayViewModal.filmDetayi?.poster ?? "")
                .frame(width: 200,height: 300).padding()
            
            Text(filmDetayViewModal.filmDetayi?.title ?? "title value")
                .onAppear(perform: {
                    self.filmDetayViewModal.filmDetayiAl(imdbId: imdbId)
                }).font(.title).foregroundColor(.blue).padding()
            
            Text(filmDetayViewModal.filmDetayi?.plot ?? "plot value")
                .onAppear(perform: {
                    self.filmDetayViewModal.filmDetayiAl(imdbId: imdbId)
                }).padding()
            
            Text("Yönetmen: \(filmDetayViewModal.filmDetayi?.director ?? "director value")")
                .onAppear(perform: {
                    self.filmDetayViewModal.filmDetayiAl(imdbId: imdbId)
                }).padding()
            
            Text("Yazar: \(filmDetayViewModal.filmDetayi?.writer ?? "writer value")")
                .onAppear(perform: {
                    self.filmDetayViewModal.filmDetayiAl(imdbId: imdbId)
                }).padding()
        }
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId : "test")
    }
}
