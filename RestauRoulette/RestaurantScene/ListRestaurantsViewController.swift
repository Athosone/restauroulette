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
    func showRestaurantDetails()
}

final class ListRestaurantsViewController: UIViewController, UICollectionViewDelegate {
    
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
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        store.dispatch(ListTenantsActions.searchTenants(searchTerm: "Coucou"))
    }
    override func loadView() {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.dataSource = self.dataSource
        collectionView.register(TenantsCell.self, forCellWithReuseIdentifier: TenantsCell.reuseID)
        
        self.view = collectionView
    }
    
    private func updateView() {
        dataSource.setDataSource(restaurants: state?.restaurants)
        collectionView.reloadData()
    }
    
    @IBAction func showFilters(_ sender: Any) {
        navigation.showFilters()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigation.showRestaurantDetails()
    }
    
}

final class ListTenantsDataSource: CollectionDataSource<TenantsCellViewModel, TenantsCell> {
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

final class TenantsCell: UICollectionViewCell, Cell {
    typealias Model = TenantsCellViewModel
    
    var item: TenantsCellViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setItem(_ item: TenantsCellViewModel) {
        
    }
}

//final class ListTenantsLayout: UICollectionViewLayout {
//
//    private var collectionViewHeight: CGFloat {
//        return collectionView!.frame.height
//    }
//
//    private var collectionViewWidth: CGFloat {
//        return collectionView!.frame.width
//    }
//
//    private var cellHeight: CGFloat {
//        return 50.0
//    }
//
//    private var cellWidth: CGFloat {
//        return 50.0
//    }
//
//    override public class var layoutAttributesClass: AnyClass {
//        return ListTenantsLayout.self
//    }
//
//    override public var collectionViewContentSize: CGSize {
//        return CGSize(width: collectionViewWidth, height: collectionViewHeight)
//    }
//
//    override func prepare() {
//        guard let collectionView = collectionView else { return }
//
//
//    }
//
//    override public func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
//        return true
//    }
//}
