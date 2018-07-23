//
//  UI+ReuseProvider.swift
//  RestauRoulette
//
//  Created by Werck Ayrton on 28/06/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//
import UIKit
import Application

extension UIStoryboard: ReuseProvider {}
extension UIViewController: ReuseProvider {}
extension UITableViewCell: ReuseProvider {}
extension UICollectionViewCell: ReuseProvider {}

extension ReuseProvider where Self: Coordinator {}
