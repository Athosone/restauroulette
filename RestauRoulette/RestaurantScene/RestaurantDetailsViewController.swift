//
//  RestaurantDetails.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 21/10/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import Foundation
import UIKit

import AthosUIKit

final class RestaurantDetailsViewController: UIViewController {
    let tableView: UITableView
    let dataSource: TableDataSource<TenantsCellViewModel, TableTenantsCell>
    init(tenant: TenantsCellViewModel) {
        let tbv = UITableView()
        let tbDS = TableDataSource<TenantsCellViewModel, TableTenantsCell>()
        
        tbDS.dataSource = [tenant]
        
        tbv.register(TableTenantsCell.self, forCellReuseIdentifier: TableTenantsCell.reuseID)
        tbv.dataSource = tbDS
        self.tableView = tbv
        self.dataSource = tbDS
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
}
