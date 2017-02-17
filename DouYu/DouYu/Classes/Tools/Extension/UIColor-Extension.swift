//
//  UIColor-Extension.swift
//  DouYu
//
//  Created by zack on 17/2/16.
//  Copyright © 2017年 Tencent. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
}
