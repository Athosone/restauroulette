//
//  FirstViewController.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 28/06/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import UIKit

protocol ListGestureTricksNavigation {
    func showFilters()
    func showRestaurantDetails()
}

final class ListGestureTricksViewController: UIViewController {
    var navigation: ListGestureTricksNavigation!
    
    //todo replace by state with a select of the state of this vc particularly
    private var viewModel: ListGestureTricksViewModel!
    
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


final class ListGestureTricksViewModel {
    
}
