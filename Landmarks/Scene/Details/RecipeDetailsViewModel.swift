//
//  RecipeDetailsViewModel.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 16.11.2022.
//

import Foundation

extension RecipeDetailsView {
    @MainActor class ViewModel : ObservableObject {
        @Published private(set) var recipe: RecipeModel?
        private var cachedRecipe: RecipeModel = RecipeModel()
        
        @Inject
        private var interactor: RecipeInteractor
        
        func fetchDetails(model: RecipeModel) {
            Task {
                await interactor.getRecipeById(id: model.id) {
                    self.recipe = $0
                }
            }
        }
    }
}
