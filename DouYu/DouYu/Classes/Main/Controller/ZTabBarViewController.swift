//
//  ZTabBarViewController.swift
//  DouYu
//
//  Created by zack on 17/1/13.
//  Copyright © 2017年 Tencent. All rights reserved.
//

import UIKit

class ZTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVc(SBName: "Home");
        addChildVc(SBName: "Live");
        addChildVc(SBName: "Focus");
        addChildVc(SBName: "Discovery");
        addChildVc(SBName: "Mine");
    }

    
    private func addChildVc(SBName:String){
        let childVc = UIStoryboard(name: SBName, bundle: nil).instantiateInitialViewController()!
        self.addChildViewController(childVc)
    }
}
