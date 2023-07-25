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
            Text(filmDetayViewModal.filmDetayi?.plot ?? "plot value")
                .onAppear(perform: {
                    self.filmDetayViewModal.filmDetayiAl(imdbId: imdbId)
                })
        }
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId : "test")
    }
}
