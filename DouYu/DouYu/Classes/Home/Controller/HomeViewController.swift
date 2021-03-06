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

    fileprivate lazy var pageTitleView : ZPageTitleView = {[weak self] in
        let frame = CGRect(x: 0, y: kStatuBarH + kNavBarH, width: kScreenW, height: kTitleViewH)
        let view :ZPageTitleView = ZPageTitleView(frame: frame , titles: ["推荐", "手游", "娱乐", "游戏", "趣玩"])
        view.delegate = self
        return view
    }()
    
    
    fileprivate lazy var contentView : ZContentView = {[weak self] in
        let contentViewY = kStatuBarH + kNavBarH + kTitleViewH
        let contentViewH = kScreenH - contentViewY
        let frame = CGRect(x: 0, y: kStatuBarH + kNavBarH + kTitleViewH, width: kScreenW, height: contentViewH)
        
        var childVCs = [UIViewController]()
        for _ in 0..<4{
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVCs.append(vc)
        }
        
        let contentView = ZContentView(frame: frame, viewControllers: childVCs, parentViewController: self)
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavUI()
    }
}


extension HomeViewController {
    fileprivate func setupNavUI() {
        
        // scroll内边距
        self.automaticallyAdjustsScrollViewInsets = false
        
        // 设置导航栏按钮
        let size = CGSize(width: 40, height: 40)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: "homeLogoIcon", highLightImgName: "", size: CGSize.zero)
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(imgName: "scanIcon", highLightImgName: "", size: size), UIBarButtonItem(imgName: "searchBtnIcon", highLightImgName: "", size: size), UIBarButtonItem(imgName: "viewHistoryIcon", highLightImgName: "", size: size)]
        
        // 添加
        self.view.addSubview(pageTitleView)
        
        self.view.addSubview(contentView)
    }

}

extension HomeViewController : ZPageTitleViewDelegate{
    func pageTitleView(_ pageTitleView: ZPageTitleView, didSelectedAtIndex index: Int){
        self.contentView.setOffsetWithIndex(index: index)
    }
}
