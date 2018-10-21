//
//  ListUI.swift
//  AthosUIKit
//
//  Created by Werck Ayrton on 14/10/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import UIKit

open class CollectionDataSource<T, U: Cell & UICollectionViewCell>: NSObject, UICollectionViewDataSource where U.Model == T {
    open var dataSource: [T] = []
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = dataSource[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: U.reuseID, for: indexPath) as? U else {
            return UICollectionViewCell()
        }
        cell.setItem(item)
        return cell
    }
    
    open func item(at indexPath: IndexPath) -> T {
        return dataSource[indexPath.row]
    }
}

open class TableDataSource<T, U: Cell & UITableViewCell>: NSObject, UITableViewDataSource where U.Model == T {
    open var dataSource: [T] = []
    
    public override init() {
        super.init()
    }
    
    init(dataSource: [T]) {
        self.dataSource = dataSource
    }
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSource[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: U.reuseID) as? U else {
            return UITableViewCell()
        }
        cell.setItem(item)
        return cell
    }
}

public protocol Cell: ReuseProvider {
    associatedtype Model
    
    var item: Model? { get }
    func setItem(_ item: Model)
}
