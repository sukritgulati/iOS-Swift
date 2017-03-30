//
//  RecipeCell.swift
//  CoredDataApp
//
//  Created by Sukrit Gulati on 3/30/17.
//  Copyright © 2017 Sukrit Gulati. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var  recipeTitle: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(recipe: Recipe){
        recipeTitle.text = recipe.title
        recipeImg.image = recipe.getRecipeImg()
    }

}
