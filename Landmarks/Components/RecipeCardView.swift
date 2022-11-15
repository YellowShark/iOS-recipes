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
            NetworkImageView(url: URL(string: NetworkImageView.testImage)!)
                .clipShape(Circle())
                .padding()
            VStack(alignment: .leading) {
                Text("Recipe")
                    .font(.title)
                Text("Details")
                    .font(.subheadline)
            }
            Spacer()
            LikeImageView(imageType: recipe.isFavorite ? .filled : .outlined)
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
