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
                    TextField(Strings.RecipeSearch.search, text: $viewModel.query)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .submitLabel(.search)
                        .onSubmit {
                            viewModel.onSearch()
                        }
                }.listRowSeparator(.hidden)
                
                Section {
                    ForEach(viewModel.recipes) { recipe in
                        RecipeCardView(recipe: recipe).background(
                            NavigationLink(
                                String(recipe.id),
                                destination: RecipeDetailsView(recipe)).opacity(0)
                        )
                    }
                }
            }.navigationTitle(Strings.RecipeSearch.title)
                .listStyle(PlainListStyle())
        }
    }
}

struct RecipeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSearchView()
    }
}
