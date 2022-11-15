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
        @Published private(set) var recipes: [RecipeModel] = []
        
        private let interactor: RecipeInteractor = DefaultRecipeInteractor()
        
        init() {
            Task {
                recipes = await interactor.fetchRecipes(query: query)
            }
        }
        
        func onSearch() {
            Task {
                recipes = await interactor.fetchRecipes(query: query)
            }
        }
    }
}
