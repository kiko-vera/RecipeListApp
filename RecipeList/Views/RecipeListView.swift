//
//  ContentView.swift
//  RecipeList
//
//  Created by Chris Vera on 4/8/21.
//

import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(.largeTitle)
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { recipe in
                            NavigationLink(
                                destination: RecipeDetailView(recipe: recipe),
                                label: {
                                    HStack(spacing: 20.0) {
                                        Image(recipe.image)
                                            .resizable()
                                            .scaledToFill().frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(10.0)
                                        Text(recipe.name)
                                            .foregroundColor(.black)
                                    }
                                })
                        }
                    }
                }
            }.padding([.leading])
            .navigationBarHidden(true)
        }
        
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
