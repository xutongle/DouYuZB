//
//  ZPageTitleView.swift
//  DouYu
//
//  Created by zack on 17/1/16.
//  Copyright © 2017年 Tencent. All rights reserved.
//

import UIKit

class ZPageTitleView: UIView {

    fileprivate lazy var scrollView : UIScrollView = {
        let scrView = UIScrollView()
        scrView.showsHorizontalScrollIndicator = false
        scrView.scrollsToTop = false
        scrView.bounces = false
        return scrView
    }()
    
    fileprivate lazy var indicatorView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }()
    
    fileprivate var titles : [String]
    
    init(frame: CGRect, titles: [String]){
        self.titles = titles
        super.init(frame: frame)
        
        //
        setupUI();
    }
    
    // 重写构造方法 必须实现下面的方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension ZPageTitleView {
    fileprivate func setupUI(){
        
        addSubview(scrollView)
        scrollView.frame = bounds
        
        // 设置title lable
        let labelW : CGFloat = frame.width/CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kScrollLineH
        let labelY : CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            let label = UILabel()
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16)
            label.textAlignment = .center
            label.textColor = UIColor.darkGray
            label.frame = CGRect(x: labelW * CGFloat(index), y: labelY, width: labelW, height: labelH)
            scrollView.addSubview(label)
        }
        
        // 添加滑块
        let viewHeight : CGFloat = 2
        
        indicatorView.frame = CGRect(x: 0, y: labelH - viewHeight, width: labelW, height: viewHeight)
        scrollView.addSubview(indicatorView)
    }
}
