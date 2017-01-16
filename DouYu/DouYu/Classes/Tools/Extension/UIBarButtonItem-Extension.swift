//
//  Extension.swift
//  DouYu
//
//  Created by zack on 17/1/13.
//  Copyright © 2017年 Tencent. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    convenience init(imgName: String, highLightImgName: String = "", size: CGSize = CGSize.zero){
        let btn = UIButton()
        btn.setImage(UIImage(named: imgName), for: .normal)
        
        if highLightImgName != ""{
            btn.setImage(UIImage(named: highLightImgName), for: .highlighted)
        }
        
        if size == CGSize.zero {
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        self.init(customView: btn)
    }
}
