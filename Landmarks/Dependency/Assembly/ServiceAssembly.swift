//
//  MainAssembly.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 16.11.2022.
//

import Foundation
import Swinject

class ServiceAssembly : Assembly {
    func assemble(container: Swinject.Container) {
        container.register(RecipeService.self) { _ in
            HttpRecipeService()
        }
    }
}
