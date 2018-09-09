//
//  FirstViewController.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 28/06/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import UIKit
import Application

protocol ListRestaurantsNavigation {
    func showFilters()
    func showRestaurantDetails()
}

final class ListRestaurantsViewController: UIViewController {
    
    var navigation: ListRestaurantsNavigation!
    //todo replace by state with a select of the state of this vc particularly
    var viewModel: ListRestaurantsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    @IBAction func showFilters(_ sender: Any) {
        navigation.showFilters()
    }
    
    @IBAction func showRestaurantDetails(_ sender: Any) {
        navigation.showRestaurantDetails()
    }
}
