//
//  CustomView.swift
//  TopNight
//
//  Created by Douglas Taquary on 08/07/15.
//  Copyright © 2015 com.douglasalexandre. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: UIView {

    var imageView: UIImageView!
    var maskLayer: CAShapeLayer!
    var ringLayer: CAShapeLayer!
    
    @IBInspectable  var image: UIImage? {
        didSet {
            if imageView != nil {
                imageView.image = image
            }
        }
    }
    
    @IBInspectable var strokeWidth: CGFloat = 1.0
    @IBInspectable var strokeColor: UIColor =
        .lightGrayColor() {
        didSet (newValue) {
            if ringLayer != nil {
                ringLayer.fillColor = newValue.CGColor
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if ringLayer == nil {
            let path = UIBezierPath(ovalInRect: CGRectInset(bounds, 1.0, 1.0))
            
            ringLayer = CAShapeLayer()
            ringLayer.path = path.CGPath
            ringLayer.fillColor = strokeColor.CGColor
            layer.insertSublayer(ringLayer, below: imageView.layer)
        }
        
        if maskLayer == nil {
            maskLayer = CAShapeLayer()
            imageView.layer.mask = maskLayer
            imageView.layer.masksToBounds = true
        }
        
        let path = UIBezierPath(ovalInRect: CGRectInset(bounds, strokeWidth + 1, strokeWidth + 1))
        maskLayer.path = path.CGPath
        
        ringLayer.frame = layer.bounds
        imageView.frame = layer.bounds
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clearColor();
        imageView = UIImageView()
        imageView.backgroundColor = UIColor.clearColor();
        addSubview(imageView)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        backgroundColor = UIColor.clearColor();
        imageView = UIImageView()
        imageView.backgroundColor = UIColor.clearColor();
        addSubview(imageView)
        
    }
    
    override func prepareForInterfaceBuilder() {
        backgroundColor = UIColor.clearColor()
    }

}
