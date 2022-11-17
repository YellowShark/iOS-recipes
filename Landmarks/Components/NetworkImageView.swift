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
    private let placeholder = "meal_placeholder"
    
    let url: String
    let height: Double
    let width: Double
    let onLoaded: (() -> Void)?
    
    init(url: String, height: Double = defautlImageSize, width: Double = defautlImageSize, onLoaded: (() -> Void)? = nil) {
        self.url = url
        self.height = height
        self.width = width
        self.onLoaded = onLoaded
    }
    
    var body: some View {
        if let url = URL(string: url) {
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
                        .onAppear {
                            (self.onLoaded ?? {})()
                        }
                case .failure:
                    Image(placeholder)
                @unknown default:
                    EmptyView()
                }
            }
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
            .background(Color.white)
        } else {
            Image(placeholder)
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height)
                .background(Color.white)
        }
    }
}

struct NetworkImageView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImageView(url: NetworkImageView.testImage)
    }
}
