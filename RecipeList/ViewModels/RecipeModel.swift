//
//  RecipeModel.swift
//  RecipeList
//
//  Created by Chris Vera on 4/8/21.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        //get the data from DataService. Using static func, so it is used on the data type and don't need to create an instance of DataService
        self.recipes = DataService.getLocalData()
    }
    
}
