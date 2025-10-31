//
//  FontLiterals.swift
//  sopt-37th-01Seminar
//
//  Created by 홍준범 on 10/14/25.
//

import Foundation
import UIKit

enum FontNames: String {
    case pretendardBold = "Pretendard-Bold"
    case pretendardSemiBold = "Pretendard-SemiBold"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardRegular = "Pretendard-Regular"
    case pretendardExtraBold = "Pretendard-ExtraBold"
}

extension UIFont {
    static func font(_ style: FontNames, ofSize size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: style.rawValue, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
    
    /// pretendardSemiBold 14
    @nonobjc class var h1: UIFont {
        return UIFont.font(.pretendardSemiBold, ofSize: 14)
    }
    
    /// pretendardBold 18
    @nonobjc class var h2: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 18)
    }
    
    
}


