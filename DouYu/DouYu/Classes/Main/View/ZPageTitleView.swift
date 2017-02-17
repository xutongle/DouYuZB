//
//  ZPageTitleView.swift
//  DouYu
//
//  Created by zack on 17/1/16.
//  Copyright © 2017年 Tencent. All rights reserved.
//

import UIKit

// :class 表示代理只能被类准守
protocol ZPageTitleViewDelegate : class{
    func pageTitleView(_ pageTitleView: ZPageTitleView, didSelectedAtIndex index: Int)
}

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
    
    weak var delegate : ZPageTitleViewDelegate?
    fileprivate var titles : [String]
    fileprivate var titleLables = [UILabel]()
    fileprivate var currIndex : Int = 0
    
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
        let labelH : CGFloat = frame.height /*- kScrollLineH*/
        let labelY : CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            let label = UILabel()
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16)
            label.textAlignment = .center
            label.textColor = UIColor.darkGray
            label.frame = CGRect(x: labelW * CGFloat(index), y: labelY, width: labelW, height: labelH)
            label.isUserInteractionEnabled = true
            let gesture = UITapGestureRecognizer.init(target: self, action: #selector(titleLableClick(tapges:)))
            label.addGestureRecognizer(gesture)
            scrollView.addSubview(label)
            titleLables.append(label)
            
            if index==0 {
                label.textColor = UIColor.orange
            }
        }
        
        // 添加滑块
        let viewHeight : CGFloat = 4
        
        indicatorView.frame = CGRect(x: 0, y: labelH - viewHeight, width: labelW, height: viewHeight)
        scrollView.addSubview(indicatorView)
    }
}


extension ZPageTitleView {
    @objc fileprivate func titleLableClick(tapges: UITapGestureRecognizer){
        guard let label = tapges.view as? UILabel else { return }
        
        let selectedLab = titleLables[currIndex]
        selectedLab.textColor = UIColor.darkGray
        
        label.textColor = UIColor.orange

        currIndex = label.tag
        
        UIView.animate(withDuration: 0.2, animations: {
            self.indicatorView.frame.origin.x = label.frame.width * CGFloat(self.currIndex);
        })
        
        self.delegate?.pageTitleView(self, didSelectedAtIndex: currIndex)
    }
}
