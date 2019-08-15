//
//  ViewController.swift
//  Popup Cell Animation
//
//  Created by Youssef on 8/15/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // with Constrains
    
    // TODO: add 3D touch
    
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
        let imageView = UIImageView(image: #imageLiteral(resourceName: "placeHolder"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(imageView)
        view.ActivateConstraint([
            imageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -10)
            ])
        cell.backgroundColor = .green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.bounds.width - 20, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        startFrame = cell.superview?.convert(cell.frame, to: nil) ?? .zero
        vc = ProductDetailsViewController()
        vc.delegate = self
        let vcView = vc.view!
        vcView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveSubVc)))
        view.addSubview(vcView)
        addChild(vc)
        
        vcView.translatesAutoresizingMaskIntoConstraints = false
        topAnchor = vcView.topAnchor.constraint(equalTo: view.topAnchor, constant: startFrame.origin.y)
        leadingAnchor = vcView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startFrame.origin.x)
        widthAnchor = vcView.widthAnchor.constraint(equalToConstant: startFrame.width)
        heightAnchor = vcView.heightAnchor.constraint(equalToConstant: startFrame.height)
        
        [topAnchor, leadingAnchor, widthAnchor, heightAnchor].forEach({ $0.isActive = true })
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            
            self.topAnchor.constant = 0
            self.leadingAnchor.constant = 0
            self.widthAnchor.constant = self.view.frame.width
            self.heightAnchor.constant = self.view.frame.height
            
            self.tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: 100)
            
            self.view.layoutIfNeeded()
        }) { (_) in
            
        }
    }
    
    var vc: ProductDetailsViewController!
    var startFrame: CGRect = .zero
    
    var topAnchor: NSLayoutConstraint!
    var leadingAnchor: NSLayoutConstraint!
    var widthAnchor: NSLayoutConstraint!
    var heightAnchor: NSLayoutConstraint!
    
    @objc
    func handleRemoveSubVc() {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            
            self.topAnchor.constant = self.startFrame.origin.y
            self.leadingAnchor.constant = self.startFrame.origin.x
            self.widthAnchor.constant = self.startFrame.width
            self.heightAnchor.constant = self.startFrame.height
            
            self.tabBarController?.tabBar.transform = .identity
            
            self.view.layoutIfNeeded()
            
        }) { (_) in
            self.vc.view.removeFromSuperview()
            self.vc.removeFromParent()
        }
    }
    
}

extension ViewController2: DismissProductDetailsViewController {
    func dismiss() {
        handleRemoveSubVc()
    }
}
