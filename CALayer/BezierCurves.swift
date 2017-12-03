//
//  BezierCurves.swift
//  CALayer
//
//  Created by Maxim Dvortsov on 22.07.17.
//  Copyright © 2017 Maxim Dvortsov. All rights reserved.
//

import UIKit

@IBDesignable

class BezierCurves: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        
        let circlePath = UIBezierPath()
        circlePath.addArc(withCenter: center, radius: 100, startAngle: 90, endAngle: 360, clockwise: true)
        //let circleColor = UIColor.blue
        let circleColor =  UIColor(cgColor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1).cgColor)
        circleColor.setStroke()
        
        circlePath.lineWidth = 10.0
        circlePath.stroke()
        
    }
    
//    @IBAction func tapped(_ sender: UIButton) {
//        
//        let animation = CABasicAnimation(keyPath: "endAngle")
//        animation.toValue = 360
//        animation.duration = 20
//        
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
//        animation.fillMode = kCAFillModeBoth
//        animation.isRemovedOnCompletion = false
//        
//        animation.delegate = self
//        
//        overShapeLayer.add(animation, forKey: nil)
//    }
}
