//
//  TPCGradientView.swift
//  WKCC
//
//  Created by tripleCC on 15/11/28.
//  Copyright © 2015年 tripleCC. All rights reserved.
//

import UIKit

class TPCGradientView: UIView {
    var gradientLayer: CAGradientLayer = CAGradientLayer()
    @IBInspectable var fromColor: UIColor = UIColor.clearColor() {
        didSet {
            gradientLayer.colors = [fromColor.CGColor, toColor.CGColor]
        }
    }
    
    @IBInspectable var toColor: UIColor = UIColor.blackColor() {
        didSet {
            gradientLayer.colors = [fromColor.CGColor, toColor.CGColor]
        }
    }
    @IBInspectable var horizontal: Bool = false {
        didSet {
            if horizontal {
                gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
            }
        }
    }
    @IBInspectable var opacity: Float = 0.5 {
        didSet {
            gradientLayer.opacity = opacity
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        gradientLayer.colors = [UIColor.clearColor().CGColor, UIColor.blackColor().CGColor];
        gradientLayer.opacity = 0.5
        gradientLayer.frame = self.bounds
        backgroundColor = UIColor.clearColor()
        layer.insertSublayer(gradientLayer, atIndex: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

}
