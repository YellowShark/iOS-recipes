//
//  NetworkImage.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 14.11.2022.
//

import SwiftUI

let defautlImageSize = 80.0

struct NetworkImageView: View {
    static let testImage = "https://www.seriouseats.com/thmb/QChcw6d_9s7rS4h57ADKBWEvxv4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/the-best-slow-cooked-bolognese-sauce-recipe-hero-03_1-3bf4f3401fa84c828f68071df496ddd3.JPG"
    
    let url: URL
    let height: Double
    let width: Double
    
    init(url: URL, height: Double = defautlImageSize, width: Double = defautlImageSize) {
        self.url = url
        self.height = height
        self.width = width
    }

    var body: some View {
        
        AsyncImage(
            url: url,
            transaction: Transaction(animation: .easeInOut)
        ) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .transition(.scale(scale: 0.1, anchor: .center))
            case .failure:
                Image(systemName: "wifi.slash")
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: width, height: height)
        .background(Color.white)
    }
}

struct NetworkImageView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImageView(url: URL(string: NetworkImageView.testImage)!)
    }
}
