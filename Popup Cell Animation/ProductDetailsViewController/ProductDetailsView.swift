//
//  ProductDetailsViewController.swift
//  El Gawla
//
//  Created by Youssef on 11/13/18.
//  Copyright © 2018 ITGeeks. All rights reserved.
//

import UIKit
import AVFoundation

class ProductDetailsView: UIView {
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.alwaysBounceVertical = true
        scroll.contentSize.height = 600
        scroll.layer.cornerRadius = 19
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    let backWhiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 19
        return view
    }()
    let backContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 19
        return view
    }()
    let mediaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.cornerRadius = 19
        return view
    }()
    var mainImage: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleToFill
//        img.layer.applySketchShadow(color: .black8, alpha: 1, x: 0, y: 8, blur: 10, spread: 0)
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let coll = UICollectionView(frame: .zero, collectionViewLayout: layout)
        coll.showsHorizontalScrollIndicator = false
        coll.backgroundColor = .clear
        coll.translatesAutoresizingMaskIntoConstraints = false
        coll.alwaysBounceHorizontal = true
//        coll.layer.applySketchShadow(color: .black8, alpha: 1, x: 0, y: 8, blur: 10, spread: 0)
        coll.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellFormainCollectionView")
        return coll
    }()
    let titleLable: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
//        title.font = UIFont.CairoBold(of: 18)
//        title.textColor = UIColor.duskBlue
        title.textAlignment = .center
        title.lineBreakMode = NSLineBreakMode.byWordWrapping
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    let catLable: UILabel = {
        let title = UILabel()
//        title.font = UIFont.CairoBold(of: 18)
//        title.textColor = UIColor.duskBlue
        title.textAlignment = .center
        title.lineBreakMode = NSLineBreakMode.byWordWrapping
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    let priceLable: UILabel = {
        let price = UILabel()
        price.numberOfLines = 1
//        price.font = UIFont.CairoSemiBold(of: 18)
//        price.textColor = .battleshipGrey
        price.textAlignment = .center
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    let discriptionLable: UILabel = {
        let discLbl = UILabel()
        discLbl.numberOfLines = 1
//        discLbl.font = UIFont.CairoSemiBold(of: 18)
//        discLbl.textColor = UIColor.battleshipGrey
        discLbl.textAlignment = .natural
        discLbl.translatesAutoresizingMaskIntoConstraints = false
        discLbl.text = "Description:"
        return discLbl
    }()
    let discriptionTextView: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.numberOfLines = 0
//        textView.textColor = .blueGrey
//        textView.font = .CairoSemiBold(of: 16)
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.8486675024, green: 0.8739581108, blue: 0.9177631736, alpha: 1)
        setupView()
    }; required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder) }
    
    func setupView () {
        addSubview(backWhiteView)
        addSubview(scrollView)
        scrollView.addSubview(backContainerView)
        backContainerView.addSubview(mediaView)
        mediaView.addSubview(mainImage)

        ActivateConstraint([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 11)
            ])

        ActivateConstraint([
            backWhiteView.topAnchor.constraint(equalTo: mainImage.topAnchor, constant: 90),
            backWhiteView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backWhiteView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backWhiteView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        
        ActivateConstraint([
            backContainerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            backContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backContainerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            ])
        
        ActivateConstraint([
            mediaView.topAnchor.constraint(equalTo: backContainerView.topAnchor, constant: 15),
            mediaView.centerXAnchor.constraint(equalTo: backContainerView.centerXAnchor),
            mediaView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.29),
            mediaView.widthAnchor.constraint(equalTo: mainImage.heightAnchor, multiplier: 1.7)
            ])
        
        ActivateConstraint([
            mainImage.topAnchor.constraint(equalTo: mediaView.topAnchor, constant: 0),
            mainImage.leadingAnchor.constraint(equalTo: mediaView.leadingAnchor, constant: 0),
            mainImage.trailingAnchor.constraint(equalTo: mediaView.trailingAnchor),
            mainImage.bottomAnchor.constraint(equalTo: mediaView.bottomAnchor, constant: 0)
            ])
        
//        backContainerView.addSubview(mainCollectionView)
//        ActivateConstraint([
//            mainCollectionView.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 10),
//            mainCollectionView.centerXAnchor.constraint(equalTo: backContainerView.centerXAnchor),
//            mainCollectionView.widthAnchor.constraint(equalTo: backContainerView.widthAnchor, multiplier: 0.98),
//            mainCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.12)
//            ])
        
        backContainerView.addSubview(titleLable)
        ActivateConstraint([
            titleLable.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 13),
            titleLable.widthAnchor.constraint(equalTo: backContainerView.widthAnchor, multiplier: 0.9),
            titleLable.centerXAnchor.constraint(equalTo: backContainerView.centerXAnchor),
            titleLable.heightAnchor.constraint(greaterThanOrEqualToConstant: 30)
            ])
        
        let lineView = giveMeLineView()
        let lineView2 = giveMeLineView()
        let lineView3 = giveMeLineView()

        backContainerView.addSubview(lineView)
        ActivateConstraint([
            lineView.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 5),
            lineView.widthAnchor.constraint(equalTo: titleLable.widthAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            lineView.centerXAnchor.constraint(equalTo: backContainerView.centerXAnchor)
            ])
        
        backContainerView.addSubview(catLable)
        ActivateConstraint([
            catLable.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10),
            catLable.widthAnchor.constraint(equalTo: backContainerView.widthAnchor, multiplier: 0.9),
            catLable.centerXAnchor.constraint(equalTo: backContainerView.centerXAnchor),
            catLable.heightAnchor.constraint(greaterThanOrEqualToConstant: 30)
            ])
        
        backContainerView.addSubview(lineView3)
        ActivateConstraint([
            lineView3.topAnchor.constraint(equalTo: catLable.bottomAnchor, constant: 5),
            lineView3.widthAnchor.constraint(equalTo: titleLable.widthAnchor),
            lineView3.heightAnchor.constraint(equalToConstant: 0.5),
            lineView3.centerXAnchor.constraint(equalTo: backContainerView.centerXAnchor)
            ])
        
        backContainerView.addSubview(priceLable)
        ActivateConstraint([
            priceLable.leadingAnchor.constraint(equalTo: lineView.leadingAnchor),
            priceLable.topAnchor.constraint(equalTo: lineView3.bottomAnchor, constant: 5),
            priceLable.heightAnchor.constraint(equalToConstant: 33),
            priceLable.trailingAnchor.constraint(equalTo: lineView.trailingAnchor)
            ])
        
        backContainerView.addSubview(lineView2)
        ActivateConstraint([
            lineView2.topAnchor.constraint(equalTo: priceLable.bottomAnchor, constant: 5),
            lineView2.widthAnchor.constraint(equalTo: lineView.widthAnchor),
            lineView2.heightAnchor.constraint(equalToConstant: 0.5),
            lineView2.centerXAnchor.constraint(equalTo: backContainerView.centerXAnchor)
            ])
        
        backContainerView.addSubview(discriptionLable)
        ActivateConstraint([
            discriptionLable.trailingAnchor.constraint(equalTo: lineView2.trailingAnchor),
            discriptionLable.topAnchor.constraint(equalTo: lineView2.bottomAnchor, constant: 5),
            discriptionLable.heightAnchor.constraint(equalToConstant: 33),
            discriptionLable.widthAnchor.constraint(equalTo: lineView2.widthAnchor, multiplier: 1)
            ])
        
        backContainerView.addSubview(discriptionTextView)
        ActivateConstraint([
            discriptionTextView.topAnchor.constraint(equalTo: discriptionLable.bottomAnchor, constant: 5),
            discriptionTextView.widthAnchor.constraint(equalTo: lineView2.widthAnchor),
            discriptionTextView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -15),
            discriptionTextView.centerXAnchor.constraint(equalTo: backContainerView.centerXAnchor)
            ])
    }
    
    func configView() {
        mainImage.image = #imageLiteral(resourceName: "placeHolder")
        titleLable.text = "data.productName"
        catLable.text = "Category:"
        priceLable.text = "Price:"
        discriptionTextView.text = """
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        data.productDescription
        """

//
//        mainImage.kf.indicatorType = .activity
//        mainImage.kf.setImage(
//            with: URL(string: data.productImage), placeholder: UIImage(named: "placeHolder"),
//            options: [
//                .scaleFactor(UIScreen.main.scale),
//                .transition(.flipFromBottom(0.5)),
//                .cacheOriginalImage,
//                ])
    }
}

extension ProductDetailsView {
    fileprivate func giveMeLineView() -> UIView {
        let lineView: UIView = {
            let line = UIView()
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = .gray
            return line
        }()
        return lineView
    }
}

extension UIView {
    func ActivateConstraint(_ ActivateConstraint: [NSLayoutConstraint]) {
        ActivateConstraint.forEach({ $0.isActive = true })
    }
}
