/*
 * Copyright Ben Hayes and Steven Crossin - Deakin 2017
 * The framework for this assigmnent and how to create it was learned from a tutorial called "CandySearch. developed by Razerware LLC, so credit for their tutorial is provided here. The below license was in the framework of their code.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 */
import UIKit
import SafariServices

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    // Ingredients passed in from the master view controller (holds currently selected ingredients)
    var detailIngredients: [Ingredients]?
    
    func configureView() {
        
        if let detailIngredients = detailIngredients {
            for ingredient in detailIngredients {
                ingredientsTextView.text.append(ingredient.name)
                ingredientsTextView.text.append("\n")
            }
        }
    }

   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    
        
    }
    
    // Called when execute button is touched and executes the search query
    @IBAction func executeButtonTouched(_ sender: UIButton) {
        executeQuery()
    }
    
    // Opens up safari view controller based on a ingredients query
    func executeQuery() {
        
        let ingredientsQueryString = detailIngredients?.reduce("", { (result, ingredient) -> String in
            return result + ingredient.name + "+"
        }) ?? ""
        
        let escapedIngredientsQuery = ingredientsQueryString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
        
        let googleUrl = "https://cse.google.com/cse/publicurl?cx=015236496974186256374:d0qdoev25cg&q=\(escapedIngredientsQuery)"
        guard let url = URL(string: googleUrl) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
}

