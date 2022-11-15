//
//  NetworkImage.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 14.11.2022.
//

import SwiftUI

let defautlImageSize = 80.0

struct NetworkImageView: View {
    static let testImage = "https://spoonacular.com/recipeImages/654928-312x231.jpg"
    
    let url: URL
    let height: Double
    let width: Double
    
    init(url: URL, height: Double = defautlImageSize, width: Double = defautlImageSize) {
        self.url = url
        self.height = height
        self.width = width
    }

    var body: some View {
        
        CacheAsyncImage(
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
        .aspectRatio(contentMode: .fill)
        .frame(width: width, height: height)
        .background(Color.white)
    }
}

struct NetworkImageView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImageView(url: URL(string: NetworkImageView.testImage)!)
    }
}
