//
//  HomeViewController.swift
//  DouYu
//
//  Created by zack on 17/1/13.
//  Copyright © 2017年 Tencent. All rights reserved.
//

import UIKit

let kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {

    fileprivate lazy var pageTitleView : ZPageTitleView = {
        let frame = CGRect(x: 0, y: kStatuBarH + kNavBarH, width: kScreenW, height: kTitleViewH)
        let view :ZPageTitleView = ZPageTitleView(frame: frame , titles: ["n"])
        view.backgroundColor = UIColor.purple
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavUI()
    }
}


extension HomeViewController {
    fileprivate func setupNavUI() {
        
        // 设置导航栏按钮
        let size = CGSize(width: 40, height: 40)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: "homeLogoIcon", highLightImgName: "", size: CGSize.zero)
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(imgName: "scanIcon", highLightImgName: "", size: size), UIBarButtonItem(imgName: "searchBtnIcon", highLightImgName: "", size: size), UIBarButtonItem(imgName: "viewHistoryIcon", highLightImgName: "", size: size)]
        
        // 添加
        self.view.addSubview(pageTitleView)
    }

}
