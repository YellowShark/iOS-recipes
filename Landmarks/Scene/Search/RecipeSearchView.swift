//
//  ContentView.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 14.11.2022.
//

import SwiftUI

struct RecipeSearchView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Search", text: $viewModel.query)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onSubmit {
                            viewModel.onSearch()
                        }
                }.listRowSeparator(.hidden)
                
                Section {
                    ForEach(viewModel.recipes) { recipe in
                        RecipeCardView(recipe: recipe).background(
                            NavigationLink(
                                recipe.id.uuidString,
                                destination: RecipeDetailsView(model: recipe)).opacity(0)
                        )
                    }
                }
            }.navigationTitle("Recipes")
                .listStyle(PlainListStyle())
        }
    }
}

struct RecipeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSearchView()
    }
}
