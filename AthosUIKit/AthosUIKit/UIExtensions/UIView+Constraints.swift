//
//  UIView+Constraints.swift
//  AthosUIKit
//
//  Created by Werck Ayrton on 21/10/2018.
//  Copyright © 2018 Ayrton. All rights reserved.
//

import UIKit


public extension UIView {
    
    public func pinIn(view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        NSLayoutConstraint.activate([
                self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0),
                self.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0),
                self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0),
                self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0),
            ])
    }
    
}
