//
//  BezierViewController.swift
//  CALayer
//
//  Created by Maxim Dvortsov on 12.10.2017.
//  Copyright © 2017 Maxim Dvortsov. All rights reserved.
//

import UIKit

class BezierViewController: UIViewController, CAAnimationDelegate {
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineCap = "round"
            shapeLayer.lineWidth = 30
            shapeLayer.strokeColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).cgColor
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 0
        }
    }
    
    override func viewDidLayoutSubviews() {
        shapeLayer.frame = view.bounds
        let path = UIBezierPath(arcCenter: CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2), radius: 100, startAngle: 0, endAngle: 360, clockwise: true)
        
        shapeLayer.path = path.cgPath
    }
    
    override func viewDidLoad() {
        
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        
    }
    
    @IBAction func tapped(_ sender: UIButton) {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 0.9
        animation.duration = 555
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.fillMode = kCAFillModeBoth
        animation.isRemovedOnCompletion = false
        
        animation.delegate = self
        
        shapeLayer.add(animation, forKey: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
