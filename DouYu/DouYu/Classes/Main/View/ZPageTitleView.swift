//
//  ZPageTitleView.swift
//  DouYu
//
//  Created by zack on 17/1/16.
//  Copyright © 2017年 Tencent. All rights reserved.
//

import UIKit

class ZPageTitleView: UIView {

    private var titles : [String]
    
    init(frame: CGRect, titles: [String]){
        self.titles = titles
        
        super.init(frame: frame)
    }
    
    // 重写构造方法 必须实现下面的方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
