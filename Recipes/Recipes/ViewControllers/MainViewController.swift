//
//  MainViewController.swift
//  Recipes
//
//  Created by Marlon Raskin on 6/17/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

	@IBOutlet var searchTextField: UITextField!
	
	let networkClient = RecipesNetworkClient()
	
	var allRecipes: [Recipe] = [] {
		didSet {
			filterRecipes()
		}
	}
	
	var recipesTableViewController: RecipesTableViewController? {
		didSet {
			self.recipesTableViewController?.recipes = filteredRecipe
		}
	}
	
	var filteredRecipe: [Recipe] = [] {
		didSet {
			recipesTableViewController?.recipes = self.filteredRecipe
		}
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		networkClient.fetchRecipes { allRecipes, error in
			if let error = error {
				print("Error loading recipes: \(error)")
				return
			}
			DispatchQueue.main.async {
				self.allRecipes = allRecipes ?? [] // Ask Conner why we have to do this
			}
		}
    }
    
	@IBAction func searchTextFieldEditingDidEnd(_ sender: UITextField) {
		resignFirstResponder()
		filterRecipes()
	}
	
	func filterRecipes() {
		if let userSearch = searchTextField.text, !userSearch.isEmpty {
			filteredRecipe = allRecipes.filter { $0.name.lowercased().contains(userSearch) || $0.instructions.lowercased().contains(userSearch) }
		} else {
			filteredRecipe = allRecipes
		}
	}
	
	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "TableViewSegue" {
			recipesTableViewController = segue.destination as? RecipesTableViewController
		} else {
			print("Could not load table view controller")
		}
		// Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
