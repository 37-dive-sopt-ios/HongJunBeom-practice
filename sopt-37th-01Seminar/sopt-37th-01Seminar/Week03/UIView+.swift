//
//  UIView+.swift
//  sopt-37th-01Seminar
//
//  Created by 홍준범 on 11/1/25.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
            views.forEach { self.addSubview($0) }
        }
}
