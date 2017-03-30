//
//  Recipe+CoreDataClass.swift
//  CoredDataApp
//
//  Created by Sukrit Gulati on 3/30/17.
//  Copyright © 2017 Sukrit Gulati. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class Recipe: NSManagedObject {

    //custom functionality
    
    func setRecipe(img: UIImage){
        let data = UIImagePNGRepresentation(img)
        self.image = data! as NSData?
    }
    
    func getRecipeImg() -> UIImage {
        let img = UIImage(data: self.image! as Data)!
        return img
    }
    
}
