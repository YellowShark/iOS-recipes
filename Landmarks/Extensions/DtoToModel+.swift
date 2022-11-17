//
//  DtoToModel+.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 15.11.2022.
//

import Foundation

extension RecipeDto {
    func toModel() -> RecipeModel {
        return RecipeModel(id: self.id, name: self.title, info: "", urlRef: self.image)
    }
}

extension FullRecipeDto {
    func toModel() -> RecipeModel {
        return RecipeModel(id: self.id, name: self.title, info: self.summary, urlRef: self.image, sourceUrl: self.sourceUrl)
    }
}
