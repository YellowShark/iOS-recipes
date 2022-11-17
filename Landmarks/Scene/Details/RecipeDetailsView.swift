//
//  RecipeDetailsView.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 15.11.2022.
//

import SwiftUI
import WebKit

struct RecipeDetailsView: View {
    @StateObject private var viewModel = ViewModel()
    let recipe: RecipeModel
    
    init(_ recipe: RecipeModel) {
        self.recipe = recipe
    }
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    NetworkImageView(url: viewModel.recipe.urlRef , height: 300, width: geometry.size.width)
                        .scaledToFill()
                    
                    HStack {
                        Text(viewModel.recipe.name)
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.largeTitle)
                            .padding(.trailing)
                        Spacer()
                        LikeImageView(imageType: viewModel.recipe.isFavorite ? .filled : .outlined)
                    }.padding(.horizontal)
                    
                    HTMLStringView(viewModel.recipe.info)
                        .padding(.horizontal)
                        .frame(height: geometry.size.height / 2.4)
                    if let url = URL(string: viewModel.recipe.sourceUrl) {
                        HStack() {
                            Spacer()
                            Link("GET FULL RECIPE", destination: url)
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(.blue, lineWidth: 4))
                            Spacer()
                        }
                    }
                    Spacer()
                }.offset(y: (geometry.safeAreaInsets.top) * (-1)).listRowInsets(EdgeInsets()).listRowSeparator(.hidden)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack())
            .onAppear {
                viewModel.fetchDetails(model: recipe)
            }
        }
    }
    
    private func btnBack() -> some View {
        Button(
            action: {
                presentationMode.wrappedValue.dismiss()
            }
        ) {
            ZStack {
                Color.white
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Image(systemName: "arrowshape.backward.fill")
                    .foregroundColor(.black)
            }
            
        }
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(
            RecipeModel(name: "Pasta", info: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", urlRef: NetworkImageView.testImage)
        )
    }
}
