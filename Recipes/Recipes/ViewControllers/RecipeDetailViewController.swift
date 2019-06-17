//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Marlon Raskin on 6/17/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

	@IBOutlet var recipeTitleLabel: UILabel!
	@IBOutlet var recipeInstructionsTextView: UITextView!
	
	var recipe: Recipe? {
		didSet {
			updateViews()
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		updateViews()
    }
	
	func updateViews() {
		if self.isViewLoaded {
			guard let recipeUnwrapped = recipe else { return }
			recipeTitleLabel.text = recipeUnwrapped.name
			recipeInstructionsTextView.text = recipeUnwrapped.instructions
		} else {
			print("Error loading receipe instruction view.")
		}
		
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
