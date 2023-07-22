//
//  ContentView.swift
//  movieBookSwiftUI
//
//  Created by Muhammed ikbal TAŞKIN on 21.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            
            Button(
                action:
                    {
                        DownloaderClient().filmleriIndir(search: "Titanic")
                        { (sonuc) in switch sonuc{
                        case .success(let filmDizisi):print(filmDizisi)
                        case .failure(let hata):print(hata.localizedDescription)
                        }
                            
                        }
                    },
                label:
                    {
                        Text("Test Yap")
                    }
            )
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
