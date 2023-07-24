//
//  OzelImage.swift
//  movieBookSwiftUI
//
//  Created by Muhammed ikbal TAŞKIN on 24.07.2023.
//

import SwiftUI

struct OzelImage: View {
    
    let url:String
    
    @ObservedObject var imageDowloanderClient=ImageDownloaderClient()
    
    init(url: String) {
        self.url = url
        self.imageDowloanderClient.gorselIndir(url: self.url)
    }
    
    var body: some View {
        if let data = imageDowloanderClient.indirilenGorsel{
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        } else {
            return Image("loading")
                .resizable()
        }
    }
}

struct OzelImage_Previews: PreviewProvider {
    static var previews: some View {
        OzelImage(url: "https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg")
    }
}
