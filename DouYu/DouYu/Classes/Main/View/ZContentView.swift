//
//  ZContentView.swift
//  DouYu
//
//  Created by zack on 17/2/15.
//  Copyright © 2017年 Tencent. All rights reserved.
//

import UIKit

private let cellID = "ContentCellID"

class ZContentView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var childViewControllers : [UIViewController]
    weak var parentViewController : UIViewController?
    
    
    fileprivate lazy var collectionView : UICollectionView = {[weak self] in

        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        let collectionView : UICollectionView = UICollectionView(frame: (self?.bounds)!, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.scrollsToTop = false
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
        return collectionView
    }()
    
    init(frame: CGRect, viewControllers: [UIViewController], parentViewController : UIViewController?){
        
        self.childViewControllers = viewControllers
        self.parentViewController = parentViewController
        
        super.init(frame: frame)

        setupUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// Mark - 私有方法
extension ZContentView {
    
    fileprivate func setupUI() {
        
        self.addSubview(collectionView)
    }
    
}

// Mark - CollectionView 代理方法
extension ZContentView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childViewControllers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        for view in cell.contentView.subviews{
            view .removeFromSuperview()
        }
        
        let vc = childViewControllers[indexPath.item]
        vc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(vc.view)
        
        return cell
    }
}

// Mark - 对外接口方法
extension ZContentView {
    func setOffsetWithIndex(index: Int) {
        let offset : CGFloat = collectionView.frame.width * CGFloat(index)
        collectionView.setContentOffset(CGPoint(x:offset, y:0), animated: false)
    }
}
