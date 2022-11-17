//
//  DetailedRecipeDto.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 16.11.2022.
//

import Foundation

class FullRecipeDto: Codable {
    let id: Int
    let title: String
    let image: String
    let sourceUrl: String
    let summary: String
}
