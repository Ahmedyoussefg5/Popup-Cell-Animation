//
//  ProductDetailsViewController.swift
//  El Gawla
//
//  Created by Youssef on 11/13/18.
//  Copyright © 2018 ITGeeks. All rights reserved.
//

import UIKit
import AVKit

protocol DismissProductDetailsViewController: class {
    func dismiss()
}

class ProductDetailsViewController: UIViewController {

    var mainView = ProductDetailsView()
    override func loadView() {
        view = mainView
    }
    
    weak var delegate: DismissProductDetailsViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.configView()
        mainView.scrollView.delegate = self
    }
}

extension ProductDetailsViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        //        print(scrollView.contentOffset.y)
        //        print(-UIScreen.main.bounds.maxY * 0.2)
        //        print(velocity.y)
        //        print(scrollView.frame.height)
        //        print(mainView.backContainerView.frame.height)
        
        if velocity.y < -1.8 {
            delegate?.dismiss()
            return
        }
        
        if scrollView.contentOffset.y < -UIScreen.main.bounds.maxY * 0.1 {
            delegate?.dismiss()
        }
    }
}
