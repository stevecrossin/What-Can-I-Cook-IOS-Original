/*
* Copyright Ben Hayes and Steven Crossin - Deakin 2017
* The framework for this assigmnent and how to create it was learned from a tutorial called "IngredientSearch. developed by Razerware LLC, so credit for their tutorial is provided here. The below license was in the framework of their code.
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

class MasterViewController: UITableViewController {
  
  // MARK: - Properties
  var detailViewController: DetailViewController? = nil
    
  // All ingredients
  var ingredients = [Ingredients]()
    
  // Ingredients filtered based on search text
  var filteredIngredients = [Ingredients]()
    
  // Currently selected ingredients
  var selectedIngredients = [Ingredients]()
    
  let searchController = UISearchController(searchResultsController: nil)
    
    // Defines if we are currently showing only the selected ingredients
    var isShowingSelected: Bool = false
    
    @IBOutlet weak var showSelectedButton: UIBarButtonItem!
  
  // MARK: - View Setup
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Setup the Search Controller
    // Setting ourselves as the delegate for search controller to get notified about search text updates
    searchController.searchResultsUpdater = self
    searchController.searchBar.delegate = self
    definesPresentationContext = true
    searchController.dimsBackgroundDuringPresentation = false
    
    // Setting the search bar to be the header of the table view
    tableView.tableHeaderView = searchController.searchBar
    
    ingredients = [
        Ingredients(category:.dairy, name:"butter"),
        Ingredients(category:.dairy, name:"eggs"),
        Ingredients(category:.dairy, name:"milk"),
        Ingredients(category:.dairy, name:"parmesan"),
        Ingredients(category:.dairy, name:"cheddar"),
        Ingredients(category:.dairy, name:"cream"),
        Ingredients(category:.dairy, name:"sour cream"),
        Ingredients(category:.dairy, name:"cream cheese"),
        Ingredients(category:.dairy, name:"mozzarella"),
        Ingredients(category:.dairy, name:"american cheese"),
        Ingredients(category:.dairy, name:"yogurt"),
        Ingredients(category:.dairy, name:"evaporated milk"),
        Ingredients(category:.dairy, name:"condensed milk"),
        Ingredients(category:.dairy, name:"whipped cream"),
        Ingredients(category:.dairy, name:"half and half"),
        Ingredients(category:.dairy, name:"monterey jack cheese"),
        Ingredients(category:.dairy, name:"feta"),
        Ingredients(category:.dairy, name:"cottage cheese"),
        Ingredients(category:.dairy, name:"ice cream"),
        Ingredients(category:.dairy, name:"goat cheese"),
        Ingredients(category:.dairy, name:"frosting"),
        Ingredients(category:.dairy, name:"swiss cheese"),
        Ingredients(category:.dairy, name:"milk"),
        Ingredients(category:.dairy, name:"velveeta"),
        Ingredients(category:.dairy, name:",ricotta"),
        Ingredients(category:.dairy, name:"powdered milk"),
        Ingredients(category:.dairy, name:"blue cheese"),
        Ingredients(category:.dairy, name:"provolone"),
        Ingredients(category:.dairy, name:"colby cheese"),
        Ingredients(category:.dairy, name:"gouda"),
        Ingredients(category:.dairy, name:"pepper jack"),
        Ingredients(category:.dairy, name:"italian cheese"),
        Ingredients(category:.dairy, name:"soft cheese"),
        Ingredients(category:.dairy, name:"romano"),
        Ingredients(category:.dairy, name:"brie"),
        Ingredients(category:.dairy, name:"pepperjack cheese"),
        Ingredients(category:.dairy, name:"custard"),
        Ingredients(category:.dairy, name:"cheese soup"),
        Ingredients(category:.dairy, name:"pizza cheese"),
        Ingredients(category:.dairy, name:"ghee"),
        Ingredients(category:.dairy, name:"pecorino cheese"),
        Ingredients(category:.dairy, name:"gruyere"),
        Ingredients(category:.dairy, name:"creme fraiche"),
        Ingredients(category:.dairy, name:"hard cheese"),
        Ingredients(category:.dairy, name:"havarti cheese"),
        Ingredients(category:.dairy, name:"mascarpone"),
        Ingredients(category:.meat, name:"chicken breast"),
        Ingredients(category:.meat, name:"ground beef"),
        Ingredients(category:.meat, name:"bacon"),
        Ingredients(category:.meat, name:"sausage"),
        Ingredients(category:.meat, name:"cooked chicken"),
        Ingredients(category:.meat, name:"ham"),
        Ingredients(category:.meat, name:"veal"),
        Ingredients(category:.meat, name:"beef steak"),
        Ingredients(category:.meat, name:"hot dog"),
        Ingredients(category:.meat, name:"pork chops"),
        Ingredients(category:.meat, name:"chicken thighs"),
        Ingredients(category:.meat, name:"ground turkey"),
        Ingredients(category:.meat, name:"pork"),
        Ingredients(category:.meat, name:"turkey"),
        Ingredients(category:.meat, name:"pepperoni"),
        Ingredients(category:.meat, name:"whole chicken"),
        Ingredients(category:.meat, name:"chicken leg"),
        Ingredients(category:.meat, name:"ground pork"),
        Ingredients(category:.meat, name:"chicken wings"),
        Ingredients(category:.meat, name:"chorizo"),
        Ingredients(category:.meat, name:"polish sausage"),
        Ingredients(category:.meat, name:"salami"),
        Ingredients(category:.meat, name:"pork roast"),
        Ingredients(category:.meat, name:"ground chicken"),
        Ingredients(category:.meat, name:"pork ribs"),
        Ingredients(category:.meat, name:"venison"),
        Ingredients(category:.meat, name:"spam"),
        Ingredients(category:.meat, name:"lamb"),
        Ingredients(category:.meat, name:"pork shoulder"),
        Ingredients(category:.meat, name:"beef roast"),
        Ingredients(category:.meat, name:"bratwurst"),
        Ingredients(category:.meat, name:"prosciutto"),
        Ingredients(category:.meat, name:"chicken roast"),
        Ingredients(category:.meat, name:"bologna"),
        Ingredients(category:.meat, name:"corned beef"),
        Ingredients(category:.meat, name:"lamb chops"),
        Ingredients(category:.meat, name:"ground lamb"),
        Ingredients(category:.meat, name:"beef ribs"),
        Ingredients(category:.meat, name:"duck"),
        Ingredients(category:.meat, name:"pancetta"),
        Ingredients(category:.meat, name:"beef liver"),
        Ingredients(category:.meat, name:"leg of lamb"),
        Ingredients(category:.meat, name:"chicken giblets"),
        Ingredients(category:.meat, name:"beef shank"),
        Ingredients(category:.meat, name:"pork belly"),
        Ingredients(category:.meat, name:"cornish hen"),
        Ingredients(category:.meat, name:"lamb shoulder"),
        Ingredients(category:.meat, name:"lamb shank"),
        Ingredients(category:.fruitAndVeg, name:"garlic"),
        Ingredients(category:.fruitAndVeg, name:"onion"),
        Ingredients(category:.fruitAndVeg, name:"olive"),
        Ingredients(category:.fruitAndVeg, name:"tomato"),
        Ingredients(category:.fruitAndVeg, name:"potato"),
        Ingredients(category:.fruitAndVeg, name:"salad greens"),
        Ingredients(category:.fruitAndVeg, name:"carrot"),
        Ingredients(category:.fruitAndVeg, name:"basil"),
        Ingredients(category:.fruitAndVeg, name:"parsley"),
        Ingredients(category:.fruitAndVeg, name:"rosemary"),
        Ingredients(category:.fruitAndVeg, name:"bell pepper"),
        Ingredients(category:.fruitAndVeg, name:"chili pepper"),
        Ingredients(category:.fruitAndVeg, name:"corn"),
        Ingredients(category:.fruitAndVeg, name:"ginger"),
        Ingredients(category:.fruitAndVeg, name:"mushroom"),
        Ingredients(category:.fruitAndVeg, name:"broccoli"),
        Ingredients(category:.fruitAndVeg, name:"spinach"),
        Ingredients(category:.fruitAndVeg, name:"green beans"),
        Ingredients(category:.fruitAndVeg, name:"celery"),
        Ingredients(category:.fruitAndVeg, name:"red onion"),
        Ingredients(category:.fruitAndVeg, name:"cilantro"),
        Ingredients(category:.fruitAndVeg, name:"cucumber"),
        Ingredients(category:.fruitAndVeg, name:"pickle"),
        Ingredients(category:.fruitAndVeg, name:"dill"),
        Ingredients(category:.fruitAndVeg, name:"avocado"),
        Ingredients(category:.fruitAndVeg, name:"sweet potato"),
        Ingredients(category:.fruitAndVeg, name:"zucchini"),
        Ingredients(category:.fruitAndVeg, name:"shallot"),
        Ingredients(category:.fruitAndVeg, name:"mixed vegetable"),
        Ingredients(category:.fruitAndVeg, name:"cabbage"),
        Ingredients(category:.fruitAndVeg, name:"asparagus"),
        Ingredients(category:.fruitAndVeg, name:"cauliflower"),
        Ingredients(category:.fruitAndVeg, name:"mint"),
        Ingredients(category:.fruitAndVeg, name:"pumpkin"),
        Ingredients(category:.fruitAndVeg, name:"kale"),
        Ingredients(category:.fruitAndVeg, name:"frozen vegetables"),
        Ingredients(category:.fruitAndVeg, name:"scallion"),
        Ingredients(category:.fruitAndVeg, name:"squash"),
        Ingredients(category:.fruitAndVeg, name:"sun dried tomato"),
        Ingredients(category:.fruitAndVeg, name:"horseradish"),
        Ingredients(category:.fruitAndVeg, name:"sweet corn"),
        Ingredients(category:.fruitAndVeg, name:"beet"),
        Ingredients(category:.fruitAndVeg, name:"lemon"),
        Ingredients(category:.fruitAndVeg, name:"banana"),
        Ingredients(category:.fruitAndVeg, name:"apple"),
        Ingredients(category:.fruitAndVeg, name:"coconut"),
        Ingredients(category:.fruitAndVeg, name:"mango"),
        Ingredients(category:.fruitAndVeg, name:"lime"),
        Ingredients(category:.fruitAndVeg, name:"orange"),
        Ingredients(category:.fruitAndVeg, name:"pineapple"),
        Ingredients(category:.fruitAndVeg, name:"strawberries"),
        Ingredients(category:.fruitAndVeg, name:"raisin"),
        Ingredients(category:.fruitAndVeg, name:"blueberries"),
        Ingredients(category:.fruitAndVeg, name:"grapeF&V"),
        Ingredients(category:.fruitAndVeg, name:"grape"),
        Ingredients(category:.fruitAndVeg, name:"prunes"),
        Ingredients(category:.fruitAndVeg, name:"nectarine"),
        Ingredients(category:.fruitAndVeg, name:"fig"),
        Ingredients(category:.fruitAndVeg, name:"peach"),
        Ingredients(category:.fruitAndVeg, name:"cranberries"),
        Ingredients(category:.fruitAndVeg, name:"raspberries"),
        Ingredients(category:.fruitAndVeg, name:"pear"),
        Ingredients(category:.fruitAndVeg, name:"cherry"),
        Ingredients(category:.fruitAndVeg, name:"apricot"),
        Ingredients(category:.fruitAndVeg, name:"blackberries"),
        Ingredients(category:.fruitAndVeg, name:"berries"),
        Ingredients(category:.fruitAndVeg, name:"date"),
        Ingredients(category:.fruitAndVeg, name:"watermelon"),
        Ingredients(category:.fruitAndVeg, name:"kiwi"),
        Ingredients(category:.fruitAndVeg, name:"craisins"),
        Ingredients(category:.fruitAndVeg, name:"mandarin"),
        Ingredients(category:.fruitAndVeg, name:"cantaloupe"),
        Ingredients(category:.fruitAndVeg, name:"plum"),
        Ingredients(category:.fruitAndVeg, name:"papaya"),
        Ingredients(category:.fruitAndVeg, name:"pomegranate"),
        Ingredients(category:.fruitAndVeg, name:"apple"),
        Ingredients(category:.fruitAndVeg, name:"rhubarb"),
        Ingredients(category:.fruitAndVeg, name:"tangerine"),
        Ingredients(category:.fruitAndVeg, name:"sultanas"),
        Ingredients(category:.fruitAndVeg, name:"currant"),
        Ingredients(category:.fruitAndVeg, name:"plantain"),
        Ingredients(category:.fruitAndVeg, name:"passion F&V"),
        Ingredients(category:.fruitAndVeg, name:"persimmons"),
        Ingredients(category:.fruitAndVeg, name:"quince"),
        Ingredients(category:.fruitAndVeg, name:"lychee"),
        Ingredients(category:.fruitAndVeg, name:"tangelos"),
        Ingredients(category:.fruitAndVeg, name:"boysenberry"),
        Ingredients(category:.fruitAndVeg, name:"star F&V"),
        Ingredients(category:.fruitAndVeg, name:"guava"),
        Ingredients(category:.spices, name:"red pepper flake"),
        Ingredients(category:.spices, name:"cinnamon"),
        Ingredients(category:.spices, name:"chive"),
        Ingredients(category:.spices, name:"vanilla"),
        Ingredients(category:.spices, name:"garlic powder"),
        Ingredients(category:.spices, name:"oregano"),
        Ingredients(category:.spices, name:"paprika"),
        Ingredients(category:.spices, name:"cayenne"),
        Ingredients(category:.spices, name:"chili powder"),
        Ingredients(category:.spices, name:"cumin"),
        Ingredients(category:.spices, name:"italian seasoning"),
        Ingredients(category:.spices, name:"thyme"),
        Ingredients(category:.spices, name:"peppercorn"),
        Ingredients(category:.spices, name:"nutmeg"),
        Ingredients(category:.spices, name:"onion powder"),
        Ingredients(category:.spices, name:"curry powder"),
        Ingredients(category:.spices, name:"clove"),
        Ingredients(category:.spices, name:"bay leaf"),
        Ingredients(category:.spices, name:"taco seasoning"),
        Ingredients(category:.spices, name:"sage"),
        Ingredients(category:.spices, name:"ground nutmeg"),
        Ingredients(category:.spices, name:"chinese five spice"),
        Ingredients(category:.spices, name:"allspice"),
        Ingredients(category:.spices, name:"turmeric"),
        Ingredients(category:.spices, name:"ground coriander"),
        Ingredients(category:.spices, name:"coriander"),
        Ingredients(category:.spices, name:"cajun seasoning"),
        Ingredients(category:.spices, name:"steak seasoning"),
        Ingredients(category:.spices, name:"herbs"),
        Ingredients(category:.spices, name:"celery salt"),
        Ingredients(category:.spices, name:"vanilla essence"),
        Ingredients(category:.spices, name:"poultry seasoning"),
        Ingredients(category:.spices, name:"marjoram"),
        Ingredients(category:.spices, name:"tarragon"),
        Ingredients(category:.spices, name:"cardamom"),
        Ingredients(category:.spices, name:"celery seed"),
        Ingredients(category:.spices, name:"garam masala"),
        Ingredients(category:.spices, name:"mustard seed"),
        Ingredients(category:.spices, name:"chilli powder"),
        Ingredients(category:.spices, name:"italian herbs"),
        Ingredients(category:.spices, name:"saffron"),
        Ingredients(category:.spices, name:"caraway"),
        Ingredients(category:.spices, name:"herbes de provence"),
        Ingredients(category:.spices, name:"italian spice"),
        Ingredients(category:.spices, name:"star anise"),
        Ingredients(category:.spices, name:"savory"),
        Ingredients(category:.spices, name:"dill seed"),
        Ingredients(category:.spices, name:"aniseed"),
        Ingredients(category:.spices, name:"cacao"),
        Ingredients(category:.spices, name:"tamarind"),
        Ingredients(category:.meat, name:"red pepper flake"),
        Ingredients(category:.meat, name:"shrimp"),
        Ingredients(category:.meat, name:"cockle"),
        Ingredients(category:.meat, name:"crawMeat"),
        Ingredients(category:.meat, name:"crab"),
        Ingredients(category:.meat, name:"scallop"),
        Ingredients(category:.meat, name:"prawns"),
        Ingredients(category:.meat, name:"clam"),
        Ingredients(category:.meat, name:"lobster"),
        Ingredients(category:.meat, name:"octopus"),
        Ingredients(category:.meat, name:"calamari"),
        Ingredients(category:.meat, name:"squid"),
        Ingredients(category:.meat, name:"oyster"),
        Ingredients(category:.meat, name:"mussel"),
        Ingredients(category:.baking, name:"wheat germ"),
        Ingredients(category:.baking, name:"flour"),
        Ingredients(category:.baking, name:"rice"),
        Ingredients(category:.baking, name:"pasta"),
        Ingredients(category:.baking, name:"bread"),
        Ingredients(category:.baking, name:"baking powder"),
        Ingredients(category:.baking, name:"bread flour"),
        Ingredients(category:.baking, name:"baking soda"),
        Ingredients(category:.baking, name:"bread crumbs"),
        Ingredients(category:.baking, name:"cornstarch"),
        Ingredients(category:.baking, name:"semolina"),
        Ingredients(category:.baking, name:"noodle"),
        Ingredients(category:.baking, name:"rolled oats"),
        Ingredients(category:.baking, name:"yeast"),
        Ingredients(category:.baking, name:"cracker"),
        Ingredients(category:.baking, name:"quinoa"),
        Ingredients(category:.baking, name:"pancake mix"),
        Ingredients(category:.baking, name:"flour tortillas"),
        Ingredients(category:.baking, name:"cornmeal"),
        Ingredients(category:.baking, name:"chips"),
        Ingredients(category:.baking, name:"saltines"),
        Ingredients(category:.baking, name:"brown rice"),
        Ingredients(category:.baking, name:"popcorn"),
        Ingredients(category:.baking, name:"self rising flour"),
        Ingredients(category:.baking, name:"macaroni cheese mix"),
        Ingredients(category:.baking, name:"corn tortillas"),
        Ingredients(category:.baking, name:"stuffing mix"),
        Ingredients(category:.baking, name:"biscuits"),
        Ingredients(category:.baking, name:"couscous"),
        Ingredients(category:.baking, name:"pie crust"),
        Ingredients(category:.baking, name:"pita"),
        Ingredients(category:.baking, name:"bisquick"),
        Ingredients(category:.baking, name:"cereal"),
        Ingredients(category:.baking, name:"angel hair"),
        Ingredients(category:.baking, name:"croutons"),
        Ingredients(category:.baking, name:"lasagne"),
        Ingredients(category:.baking, name:"ramen"),
        Ingredients(category:.baking, name:"baguette"),
        Ingredients(category:.baking, name:"pizza dough"),
        Ingredients(category:.baking, name:"barley"),
        Ingredients(category:.baking, name:"puff pastry"),
        Ingredients(category:.baking, name:"bagel"),
        Ingredients(category:.baking, name:"pretzel"),
        Ingredients(category:.baking, name:"cream of wheat"),
        Ingredients(category:.baking, name:"multigrain bread"),
        Ingredients(category:.baking, name:"crescent roll dough"),
        Ingredients(category:.baking, name:"pierogi"),
        Ingredients(category:.baking, name:"hot dog bun"),
        Ingredients(category:.baking, name:"filo dough"),
        Ingredients(category:.baking, name:"wheat"),
        Ingredients(category:.baking, name:"ravioli"),
        Ingredients(category:.baking, name:"muffin mix"),
        Ingredients(category:.baking, name:"gnocchi"),
        Ingredients(category:.baking, name:"bread dough"),
        Ingredients(category:.baking, name:"potato flakes"),
        Ingredients(category:.baking, name:"rye"),
        Ingredients(category:.baking, name:"croissants"),
        Ingredients(category:.baking, name:"matzo meal"),
        Ingredients(category:.baking, name:"shortcrust pastry"),
        Ingredients(category:.baking, name:"ciabatta"),
        Ingredients(category:.baking, name:"breadsticks"),
        Ingredients(category:.baking, name:"angel food"),
        Ingredients(category:.baking, name:"risotto"),
        Ingredients(category:.baking, name:"spelt"),
        Ingredients(category:.other, name:"vegetable oil"),
        Ingredients(category:.other, name:"olive oil"),
        Ingredients(category:.other, name:"peanut oil"),
        Ingredients(category:.other, name:"cooking spray"),
        Ingredients(category:.other, name:"shortening"),
        Ingredients(category:.other, name:"lard"),
        Ingredients(category:.other, name:"almond oil"),
        Ingredients(category:.other, name:"grape seed oil"),
        Ingredients(category:.baking, name:"sugar"),
        Ingredients(category:.baking, name:"honey"),
        Ingredients(category:.baking, name:"confectioners sugar"),
        Ingredients(category:.baking, name:"maple syrup"),
        Ingredients(category:.baking, name:"syrup"),
        Ingredients(category:.baking, name:"molasses"),
        Ingredients(category:.baking, name:"corn syrup"),
        Ingredients(category:.spices, name:"cream of tartar"),
        Ingredients(category:.spices, name:"bouillon"),
        Ingredients(category:.spices, name:"ground ginger"),
        Ingredients(category:.spices, name:"sesame seed"),
        Ingredients(category:.spices, name:"apple cider"),
        Ingredients(category:.spices, name:"chili sauce"),
        Ingredients(category:.spices, name:"liquid smoke"),
        Ingredients(category:.spices, name:"balsamic glaze"),
        Ingredients(category:.spices, name:"hoisin sauce"),
        Ingredients(category:.spices, name:"vegetable bouillon"),
        Ingredients(category:.spices, name:"soya sauce"),
        Ingredients(category:.spices, name:"rice wine"),
        Ingredients(category:.spices, name:"rose water"),
        Ingredients(category:.spices, name:"Meat stock"),
        Ingredients(category:.spices, name:"champagne vinegar"),
        Ingredients(category:.nuts, name:"peanut"),
        Ingredients(category:.nuts, name:"chestnut"),
        Ingredients(category:.nuts, name:"almond"),
        Ingredients(category:.nuts, name:"cashew"),
        Ingredients(category:.nuts, name:"walnut"),
        Ingredients(category:.nuts, name:"peanut"),
        Ingredients(category:.nuts, name:"pecan"),
        Ingredients(category:.nuts, name:"flax"),
        Ingredients(category:.nuts, name:"pine nut"),
        Ingredients(category:.nuts, name:"pistachio"),
        Ingredients(category:.nuts, name:"almond meal"),
        Ingredients(category:.nuts, name:"praline"),
        Ingredients(category:.nuts, name:"hazelnut"),
        Ingredients(category:.nuts, name:"macadamia"),
        Ingredients(category:.nuts, name:"almond paste"),
        Ingredients(category:.nuts, name:"macaroon"),
        Ingredients(category:.other, name:"mayonnaise"),
        Ingredients(category:.other, name:"mustard"),
        Ingredients(category:.other, name:"ketchup"),
        Ingredients(category:.other, name:"vinegar"),
        Ingredients(category:.other, name:"balsamic vinegar"),
        Ingredients(category:.other, name:"wine vinegar"),
        Ingredients(category:.other, name:"cider vinegar"),
        Ingredients(category:.other, name:"rice vinegar"),
        Ingredients(category:.other, name:"mirin"),
        Ingredients(category:.other, name:"apple cider vinegar"),
        Ingredients(category:.other, name:"Meat sauce"),
        Ingredients(category:.other, name:"blue cheese dressing"),
        Ingredients(category:.baking, name:"chocolate"),
        Ingredients(category:.baking, name:"apple sauce"),
        Ingredients(category:.baking, name:"graham cracker"),
        Ingredients(category:.baking, name:"marshmallow"),
        Ingredients(category:.baking, name:"potato chips"),
        Ingredients(category:.baking, name:"pudding mix"),
        Ingredients(category:.baking, name:"chocolate morsels"),
        Ingredients(category:.baking, name:"bittersweet chocolate"),
        Ingredients(category:.baking, name:"cookie dough"),
        Ingredients(category:.baking, name:"chocolate syrup"),
        Ingredients(category:.baking, name:"nutella"),
        Ingredients(category:.other, name:"apple juice"),
        Ingredients(category:.other, name:"coffee"),
        Ingredients(category:.other, name:"orange juice"),
        Ingredients(category:.other, name:"tea"),
        Ingredients(category:.other, name:"espresso"),
        Ingredients(category:.other, name:"tomato juice"),
        Ingredients(category:.other, name:"green tea"),
        Ingredients(category:.other, name:"cranberry juice"),
        Ingredients(category:.other, name:"coke"),
        Ingredients(category:.other, name:"lemonade"),
        Ingredients(category:.other, name:"ginger ale"),
        Ingredients(category:.other, name:"pineapple juice"),
        Ingredients(category:.other, name:"fruit juice"),
        Ingredients(category:.other, name:"club soda"),
        Ingredients(category:.other, name:"sprite"),
        Ingredients(category:.other, name:"grenadine"),
        Ingredients(category:.other, name:"margarita mix"),
        Ingredients(category:.other, name:"chicken stock"),
        Ingredients(category:.other, name:"mushroom soup"),
        Ingredients(category:.other, name:"beef stock"),
        Ingredients(category:.other, name:"tomato soup"),
        Ingredients(category:.other, name:"vegetable stock"),
        Ingredients(category:.other, name:"chicken soup"),
        Ingredients(category:.other, name:"celery soup"),
        Ingredients(category:.other, name:"onion soup"),
        Ingredients(category:.other, name:"vegetable soup"),
        Ingredients(category:.other, name:"dashi"),
        Ingredients(category:.dairy, name:"soy milk"),
        Ingredients(category:.dairy, name:"almond milk"),
        Ingredients(category:.dairy, name:"coconut milk"),
        Ingredients(category:.dairy, name:"hemp milk"),
        Ingredients(category:.fruitAndVeg, name:"peas"),
        Ingredients(category:.fruitAndVeg, name:"black beans"),
        Ingredients(category:.fruitAndVeg, name:"chickpea"),
        Ingredients(category:.fruitAndVeg, name:"lentil"),
        Ingredients(category:.fruitAndVeg, name:"hummus"),
        Ingredients(category:.fruitAndVeg, name:"soybeans"),
        Ingredients(category:.fruitAndVeg, name:"pinto beans"),
        Ingredients(category:.fruitAndVeg, name:"cannellini beans"),
        Ingredients(category:.fruitAndVeg, name:"navy beans"),
        Ingredients(category:.fruitAndVeg, name:"kidney beans"),
        Ingredients(category:.fruitAndVeg, name:"lima beans"),
        Ingredients(category:.fruitAndVeg, name:"green beans"),
        Ingredients(category:.fruitAndVeg, name:"french beans"),
        Ingredients(category:.other, name:"tomato sauce"),
        Ingredients(category:.other, name:"tomato paste"),
        Ingredients(category:.other, name:"chicken gravy"),
        Ingredients(category:.other, name:"pesto"),
        Ingredients(category:.other, name:"beef gravy"),
        Ingredients(category:.other, name:"alfredo sauce"),
        Ingredients(category:.other, name:"curry paste"),
        Ingredients(category:.other, name:"liqueur"),
        Ingredients(category:.other, name:"whiskey"),
        Ingredients(category:.other, name:"beer"),
        Ingredients(category:.other, name:"white wine"),
        Ingredients(category:.other, name:"red wine"),
        Ingredients(category:.other, name:"champagne"),
        Ingredients(category:.other, name:"rum"),
        Ingredients(category:.other, name:"frangelico"),
        Ingredients(category:.other, name:"brandy"),
        Ingredients(category:.other, name:"vodka"),
        Ingredients(category:.other, name:"tequila"),
        Ingredients(category:.other, name:"sherry"),
        Ingredients(category:.other, name:"bitters"),
        Ingredients(category:.other, name:"cooking wine"),
        Ingredients(category:.other, name:"bourbon"),
        Ingredients(category:.other, name:"kahlua"),
        Ingredients(category:.other, name:"gin"),
        Ingredients(category:.other, name:"whisky"),
        Ingredients(category:.other, name:"irish cream"),
        Ingredients(category:.other, name:"sake"),
        Ingredients(category:.other, name:"amaretto"),
        Ingredients(category:.other, name:"vermouth"),
        Ingredients(category:.other, name:"triple sec"),
        Ingredients(category:.other, name:"grappa"),
        Ingredients(category:.other, name:"masala"),
        Ingredients(category:.other, name:"grand marnier"),
        Ingredients(category:.other, name:"cabernet sauvignon"),
        Ingredients(category:.other, name:"dessert wine"),
        Ingredients(category:.other, name:"schnapps"),
        Ingredients(category:.other, name:"port wine"),
        Ingredients(category:.other, name:"burgundy wine"),
        Ingredients(category:.other, name:"sparkling wine"),
        Ingredients(category:.other, name:"cognac"),
        Ingredients(category:.other, name:"chocolate liqueur"),
        Ingredients(category:.other, name:"curacao"),
        Ingredients(category:.other, name:"creme de menthe"),
        Ingredients(category:.other, name:"limoncello"),
        Ingredients(category:.other, name:"raspberry liquor"),
        Ingredients(category:.other, name:"shaoxing wine"),
        Ingredients(category:.other, name:"madeira wine"),
        Ingredients(category:.other, name:"absinthe"),
        Ingredients(category:.other, name:"ouzo"),
        Ingredients(category:.other, name:"anisette")]
    
    
    if let splitViewController = splitViewController {
      let controllers = splitViewController.viewControllers
      detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    // Clears the cell selection when this view controller appears; if we are using the split view controller
    clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
    super.viewWillAppear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table View
    
    // Defines how many sections do we need in a table view
  override func numberOfSections(in tableView: UITableView) -> Int {
    // We always present all the ingredient categories as sections
    return Ingredients.Category.allCategories().count
  }
  
    // Returns the nmber of ingredients in a given section
    // The number depends on the state we are currently in (showing selected or searching or default)
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    let category = Ingredients.Category.allCategories()[section]
    
    if isShowingSelected {
        return selectedIngredients.filter { $0.category == category }.count
    }
    else if searchController.isActive {
        return filteredIngredients.filter { $0.category == category }.count
    }
    
    return ingredients.filter { $0.category == category }.count
  }
    
    // Returns a string that defines a ingredient category name for a given section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let category = Ingredients.Category.allCategories()[section]
        // Here we are taking the String associated value of the category enum
        return category.rawValue
    }
  
    // Returns a cell configured for an ingredient at a given index path
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    // Get the ingredient at the given index path
    let currentIngredient = ingredient(at: indexPath)
    
    // Check if the current ingredient is already selected
    let isCurrentIngredientSelected = selectedIngredients.contains {
        $0.category == currentIngredient.category && $0.name == currentIngredient.name
    }
    
    // Configure cell based on the ingredient properties
    cell.textLabel?.text = currentIngredient.name
    cell.detailTextLabel?.text = currentIngredient.category.rawValue
    cell.accessoryType = isCurrentIngredientSelected ? UITableViewCell.AccessoryType.checkmark : UITableViewCell.AccessoryType.none
    cell.tintColor = .blue
    
    return cell
  }
  
    // Filters ingredients based on a search text and updates the table view
  func filterContentForSearchText(_ searchText: String) {
    
    if searchText.isEmpty {
        filteredIngredients = ingredients
    }
    else {
        filteredIngredients = ingredients.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    
    tableView.reloadData()
  }

    
    // Performs selection/deselection of a particular ingredient and updates the selected ingredients array accordingly
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.tintColor = .blue
        
        let selectedIngredient = ingredient(at: indexPath)
        
        if cell?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            cell?.accessoryType = UITableViewCell.AccessoryType.none
            
            let indexOfIngredient = selectedIngredients.index { $0.category == selectedIngredient.category && $0.name == selectedIngredient.name }
            if let index = indexOfIngredient {
                selectedIngredients.remove(at: index)
            }
        }
        else if cell?.accessoryType == UITableViewCell.AccessoryType.none {
            selectedIngredients.append(selectedIngredient)
            
            cell?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Returns an ingredient for a given index path, based on a state we are currently in (showing selected, searching or default)
    func ingredient(at indexPath: IndexPath) -> Ingredients {
        let category = Ingredients.Category.allCategories()[indexPath.section]
        
        if isShowingSelected {
            return selectedIngredients.filter { $0.category == category }[indexPath.row]
        }
        else if searchController.isActive {
            return filteredIngredients.filter { $0.category == category }[indexPath.row]
        }
        else {
            return ingredients.filter { $0.category == category }[indexPath.row]
        }
    }
  
  // MARK: - Segues
    
    // Prepares for a segue by passing currently selected ingredients to a destination view controller
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "revealYourIngredients" {
        guard let controller = segue.destination as? DetailViewController else { return }
        controller.detailIngredients = selectedIngredients
        controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        controller.navigationItem.leftItemsSupplementBackButton = true
    }
  }
    
    
    // Toggles the "showing selected" state on/off and updates the table view accordingly
    @IBAction func showSelectedButtonTouched(_ sender: UIBarButtonItem) {
        isShowingSelected = !isShowingSelected
        showSelectedButton.title = isShowingSelected ? "Hide selected" : "Show selected"
        tableView.reloadData()
    }
  
}

extension MasterViewController: UISearchBarDelegate {
  // MARK: - UISearchBar Delegate
}

extension MasterViewController: UISearchResultsUpdating {
  // MARK: - UISearchResultsUpdating Delegate
    
    // Called when the search text changes and calls ingredient filtering method
  func updateSearchResults(for searchController: UISearchController) {
    filterContentForSearchText(searchController.searchBar.text ?? "")
  }
}
