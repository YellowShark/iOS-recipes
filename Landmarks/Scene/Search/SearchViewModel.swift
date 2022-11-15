//
//  SearchViewModel.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 15.11.2022.
//

import Foundation

extension RecipeSearchView {
    @MainActor class ViewModel : ObservableObject {
        @Published var query: String = ""
        @Published private(set) var recipes = [
            RecipeModel(name: "String", info: "String", urlRef: NetworkImageView.testImage),
            RecipeModel(name: "String", info: "String", urlRef: NetworkImageView.testImage),
            RecipeModel(name: "String", info: "String", urlRef: NetworkImageView.testImage),
            RecipeModel(name: "String", info: "String", urlRef: NetworkImageView.testImage),
            RecipeModel(name: "String", info: "String", urlRef: NetworkImageView.testImage),
            RecipeModel(name: "String", info: "String", urlRef: NetworkImageView.testImage)
        ]
        
        func onSearch() {
            
        }
    }
}
