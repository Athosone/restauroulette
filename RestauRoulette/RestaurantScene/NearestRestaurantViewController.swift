//
//  FirstViewController.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 28/06/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import UIKit

protocol NearestRestaurantNavigation {
    func showFilters()
    func showRestaurantDetails()
}

final class NearestRestaurantViewController: UIViewController {
    var navigation: NearestRestaurantNavigation!
    private var viewModel: NearestRestaurantViewModel!
    
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


final class NearestRestaurantViewModel {
    
}
