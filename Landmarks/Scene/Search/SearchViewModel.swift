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
        @Published private(set) var recipes = [RecipeModel]()
        
        @Inject
        private var interactor: RecipeInteractor
        
        init() { onSearch() }
        
        func onSearch() {
            Task {
                await interactor.fetchRecipes(query: query) {
                    self.recipes = $0
                }
            }
        }
    }
}
