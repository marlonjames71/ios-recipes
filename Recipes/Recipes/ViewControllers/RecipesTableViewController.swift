//
//  RecipesTableViewController.swift
//  Recipes
//
//  Created by Marlon Raskin on 6/17/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {

	var recipes: [Recipe] = [] {
		didSet {
			tableView.reloadData() //Ask Conner why this is being called here on the recipes property
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recipes.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
		//How to know exactly what we need
		let recipe = recipes[indexPath.row]
		cell.textLabel?.text = recipe.name
		
        return cell
    }

	
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ShowDetailSegue" {
			let detailVC = segue.destination as! RecipeDetailViewController
			let indexPath = tableView.indexPathForSelectedRow
			guard let selectedIndexPath = indexPath else { return }
			detailVC.recipe = self.recipes[selectedIndexPath.row]
		} else {
			print("Error. Could not find recipe.")
		}
		
        // Pass the selected object to the new view controller.
    }
}
