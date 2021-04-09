//
//  ContentView.swift
//  RecipeList
//
//  Created by Chris Vera on 4/8/21.
//

import SwiftUI

struct RecipeListView: View {
    //Reference the ViewModel
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationView {
            List(model.recipes) { recipe in
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
                        }
                    })
            }.navigationBarTitle("All Recipes")
        }
        
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
