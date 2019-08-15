//
//  ViewController.swift
//  Popup Cell Animation
//
//  Created by Youssef on 8/15/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // with Frame
    
    lazy var mainCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let coll = UICollectionView (frame: .zero, collectionViewLayout: layout)
        coll.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "T##String")
        coll.backgroundColor = .gray
        coll.translatesAutoresizingMaskIntoConstraints = false
        return coll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainCollectionView)
        NSLayoutConstraint.activate([
            mainCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "T##String", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.bounds.width - 20, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)!
        startFrame = cell.superview!.convert(cell.frame, to: nil)
        vc = UIViewController()
        let vcView = vc.view!
        vcView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveSubVc(_:))))
        vcView.backgroundColor = .red
        view.addSubview(vcView)
        addChild(vc)
        vcView.frame = startFrame
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            vcView.frame = self.view.frame
            self.tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: 100)
        }) { (_) in
            
        }
    }

    var vc: UIViewController!
    var startFrame: CGRect = .zero
    
    @objc
    func handleRemoveSubVc(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            sender.view?.frame = self.startFrame
            self.tabBarController?.tabBar.transform = .identity
        }) { (_) in
            sender.view?.removeFromSuperview()
            self.vc.removeFromParent()
        }
    }
    
}

