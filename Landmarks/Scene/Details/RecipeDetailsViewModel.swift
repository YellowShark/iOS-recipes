//
//  RecipeDetailsViewModel.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 16.11.2022.
//

import Foundation

extension RecipeDetailsView {
    @MainActor class ViewModel : ObservableObject {
        @Published private(set) var recipe: RecipeModel = RecipeModel()
        private var cachedRecipe: RecipeModel = RecipeModel()
        
        @Inject
        private var interactor: RecipeInteractor
        
        func fetchDetails(model: RecipeModel) {
            Task {
                recipe = await interactor.fetchDetails(model: model)
            }
        }
    }
}
