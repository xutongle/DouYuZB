//
//  ZContentView.swift
//  DouYu
//
//  Created by zack on 17/2/15.
//  Copyright © 2017年 Tencent. All rights reserved.
//

import UIKit

class ZContentView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var viewController : [UIViewController]
    var parentViewController : UIViewController
    
    init(frame: CGRect, viewController: [UIViewController], parentViewController : UIViewController){
        
        self.viewController = viewController
        self.parentViewController = parentViewController
        
        super.init(frame: frame)

        //setupUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
