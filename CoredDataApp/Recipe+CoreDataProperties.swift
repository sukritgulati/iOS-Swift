//
//  Recipe+CoreDataProperties.swift
//  CoredDataApp
//
//  Created by Sukrit Gulati on 3/30/17.
//  Copyright © 2017 Sukrit Gulati. All rights reserved.
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe");
    }

    @NSManaged public var image: NSData?
    @NSManaged public var ingredients: String?
    @NSManaged public var steps: String?
    @NSManaged public var title: String?

}
