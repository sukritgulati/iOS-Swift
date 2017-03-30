//
//  RecipeVC.swift
//  CoredDataApp
//
//  Created by Sukrit Gulati on 3/30/17.
//  Copyright © 2017 Sukrit Gulati. All rights reserved.
//

import UIKit
import CoreData

class RecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeIngredients: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var addRecipeBtn: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        recipeImg.layer.cornerRadius = 4.0
        recipeImg.clipsToBounds = true
    
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        recipeImg.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
    }
    
    @IBAction func addImage(sender: AnyObject!) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createRecipe(sender: AnyObject!) {
        if let title = recipeTitle.text, title != "" {
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
            //entity reference
            let entity = NSEntityDescription.entity(forEntityName: "Recipe", in: context)!
            //object class for the entity
            let recipe = Recipe(entity: entity, insertInto: context)
        
            recipe.title = title
            recipe.ingredients = recipeIngredients.text
            recipe.steps = recipeSteps.text
            recipe.setRecipe(img: recipeImg.image!)
            
            context.insert(recipe)
            
            do {
                try context.save()
            } catch {
                print("Cpould not save recipe")
            }
            
            self.navigationController?.popViewController(animated: false)
        }
    }

}
