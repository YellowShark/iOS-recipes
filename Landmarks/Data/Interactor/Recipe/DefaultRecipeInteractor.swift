//
//  DefaultRecipeInteractor.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 15.11.2022.
//

import Foundation

class DefaultRecipeInteractor : RecipeInteractor {
    private let service: RecipeService
    private let repository: RecipeRepository
    
    init(_ service: RecipeService, _ repository: RecipeRepository) {
        self.service = service
        self.repository = repository
    }
    
    func fetchRecipes(query: String, _ onSuccess: @escaping ([RecipeModel]) -> Void) async {
        let results = await service.fetchRecipes(query: query)
        DispatchQueue.main.async {
            self.repository.saveRecipes(results) { err in
                if let error = err {
                    print(error)
                }
                onSuccess(self.repository.getRecipesByName(query))
            }
        }
    }
    
    func getRecipeById(id: Int, _ onSuccess: @escaping (RecipeModel) -> Void) async {
        let result = await service.fetchDetails(id: id)

        DispatchQueue.main.async {
            self.repository.saveRecipe(result) { err in
                if let error = err {
                    print(error)
                }
                onSuccess(self.repository.getRecipeById(result.id))
            }
        }
    }
}
