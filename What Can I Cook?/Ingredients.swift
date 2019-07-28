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

import Foundation

struct Ingredients {
    
    // Defines all the possible categories for the ingredients
    enum Category: String {
        case meat = "Meat"
        case dairy = "Dairy"
        case fruitAndVeg = "Fruit and Veg"
        case baking = "Baking"
        case spices = "Spices"
        case nuts = "Nuts"
        case other = "Other"
        
        static func allCategories() -> [Category] {
            return [.meat, .dairy, .fruitAndVeg, .baking, .spices, .nuts, .other]
        }
    }
    
  let category: Category
  let name: String
}
