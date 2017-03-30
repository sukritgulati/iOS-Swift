//
//  ViewController.swift
//  CoredDataApp
//
//  Created by Sukrit Gulati on 3/29/17.
//  Copyright © 2017 Sukrit Gulati. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var recipies = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    func fetchAndSetResults() {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        //grab all entitites with name recipe
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
        
        do {
            //getting all the results
            let results = try context.fetch(fetchRequest)
            self.recipies = results as! [Recipe]
        } catch let err as Error {
            print(err.localizedDescription)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as? RecipeCell {
            
            let recipe = recipies[indexPath.row]
            cell.configureCell(recipe: recipe)
            return cell
        } else {
            return RecipeCell()
        }
       
    }
    
    
    
    
}

