//
//  FirstViewController.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 28/06/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import UIKit
import Application
import RxSwift
import AthosUIKit
import Domain

protocol ListRestaurantsNavigation {
    func showFilters()
    func showRestaurantDetails(with restaurants: Restaurant)
}

final class ListRestaurantsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var navigation: ListRestaurantsNavigation!
    
    private let dataSource = ListTenantsDataSource()
    private let disposeBag = DisposeBag()

    var collectionView: UICollectionView {
        return self.view as! UICollectionView
    }
    
    var state: ListRestaurantsState? {
        didSet {
            updateView()
        }
    }
    
    override func loadView() {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.dataSource = self.dataSource
        collectionView.register(CollectionTenantsCell.self, forCellWithReuseIdentifier: CollectionTenantsCell.reuseID)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        self.view = collectionView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        store.dispatch(ListTenantsActions.searchTenants(searchTerm: "Coucou"))
    }
    
    private func updateView() {
        dataSource.setDataSource(restaurants: state?.restaurants)
        collectionView.reloadData()
    }
    
    @IBAction func showFilters(_ sender: Any) {
        navigation.showFilters()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let restaurant = state?.restaurants?[indexPath.row] else {
            return
        }
        navigation.showRestaurantDetails(with: restaurant)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 50)
    }
}

final class ListTenantsDataSource: CollectionDataSource<TenantsCellViewModel, CollectionTenantsCell> {
    func setDataSource(restaurants: [Restaurant]?) {
        let sources = restaurants?.map({ (restaurant: Restaurant) -> TenantsCellViewModel in
            return TenantsCellViewModel(name: restaurant.name, image: UIImage())
        })
        self.dataSource = sources ?? []
    }
}

struct TenantsCellViewModel {
    let name: String
    let image: UIImage
}

final class CollectionTenantsCell: UICollectionViewCell, Cell {
    typealias Model = TenantsCellViewModel
    
    var item: TenantsCellViewModel?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        titleLabel.pinIn(view: self.contentView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setItem(_ item: TenantsCellViewModel) {
        titleLabel.text = item.name
    }
}

final class TableTenantsCell: UITableViewCell, Cell {
    typealias Model = TenantsCellViewModel
    
    var item: TenantsCellViewModel?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.white
        titleLabel.pinIn(view: self.contentView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setItem(_ item: TenantsCellViewModel) {
        titleLabel.text = item.name
    }
}
