//
//  InteractorAssembly.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 16.11.2022.
//

import Foundation
import Swinject

class InteractorAssembly : Assembly {
    func assemble(container: Swinject.Container) {
        container.register(RecipeInteractor.self) { r in
            DefaultRecipeInteractor(r.resolve(RecipeService.self)!)
        }
    }
}
