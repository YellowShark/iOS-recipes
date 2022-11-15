//
//  RecipeModel.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 14.11.2022.
//

import Foundation

struct RecipeModel: Identifiable {
    let id = UUID()
    let name: String
    let info: String
    let urlRef: String
    let isFavorite: Bool = false
}
