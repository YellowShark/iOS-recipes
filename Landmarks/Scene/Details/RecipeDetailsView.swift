//
//  RecipeDetailsView.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 15.11.2022.
//

import SwiftUI

struct RecipeDetailsView: View {
    let model: RecipeModel
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { geometry in
            List {
                VStack(alignment: .leading) {
                    NetworkImageView(url: URL(string: model.urlRef)!, height: 300, width: .infinity)
                        .scaledToFit()
                    HStack {
                        Text(model.name)
                            .font(.largeTitle)
                        Spacer()
                        LikeImageView(imageType: model.isFavorite ? .filled : .outlined)
                    }.padding(.leading)
                    Text(model.info)
                        .font(.body)
                        .padding()
                    Spacer()
                    
                }.offset(y: geometry.safeAreaInsets.top * (-1)).listRowInsets(EdgeInsets())
            }.listStyle(PlainListStyle())
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack())
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
            model: RecipeModel(name: "Pasta", info: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", urlRef: NetworkImageView.testImage)
        )
    }
}
