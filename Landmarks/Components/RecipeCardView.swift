//
//  RecipeCardView.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 14.11.2022.
//

import SwiftUI

let likeThumbSize = 32.0

struct RecipeCardView: View {
    let recipe: RecipeModel
    
    var body: some View {
        HStack {
            NetworkImageView(url: recipe.urlRef)
                .scaledToFill()
                .clipShape(Circle())
                .padding()

            Text(recipe.name)
                .font(.title)
                .lineLimit(2)
            Spacer()
            LikeImageView(imageType: recipe.isFavorite ? .filled : .outlined).padding()
        }
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(
            recipe: RecipeModel(
                name: "Recipe",
                info: "Details",
                urlRef: NetworkImageView.testImage
            )
        )
    }
}
