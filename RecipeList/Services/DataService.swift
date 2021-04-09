//
//  DataService.swift
//  RecipeList
//
//  Created by Chris Vera on 4/8/21.
//

import Foundation

class DataService {
    static func getLocalData() -> [Recipe] {
        //parse local json file
        
        //get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        guard pathString != nil else {
            return [Recipe]()
        }
        //create url object
        let url = URL(fileURLWithPath: pathString!)
        //create data object
        do {
            let data = try Data(contentsOf: url)
            //decode the data with the JSON decoder
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                //add the unique IDs
                for recipes in recipeData {
                    recipes.id = UUID()
                }
                //return the recipes
                return recipeData
            } catch {
                print("Error with parsing JSON.")
                print(error)
            }
        } catch {
            print("Error with getting data from path.")
            print(error)
        }
        //only returns this if everything else fails
        return [Recipe]()
    }
}
