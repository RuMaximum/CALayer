//
//  ViewController.swift
//  CALayer
//
//  Created by Maxim Dvortsov on 21.07.17.
//  Copyright © 2017 Maxim Dvortsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {
    
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 20
            shapeLayer.lineCap = "round"
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            let color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            shapeLayer.strokeColor = color
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        didSet {
            overShapeLayer.lineWidth = 10
            overShapeLayer.lineCap = "round"
            overShapeLayer.fillColor = nil
            overShapeLayer.strokeEnd = 0
            let color = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1).cgColor
            overShapeLayer.strokeColor = color
        }
    }

    
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0) // 0 0 левый верхний угол
            gradientLayer.endPoint = CGPoint(x: 0, y: 1) // 0 1 левый нижний угол
            
            let startColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1).cgColor
            gradientLayer.colors = [startColor, endColor]
            //gradientLayer.locations = [0, 0.1, 1]
        }
    }
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.size.height / 2
            imageView.layer.masksToBounds = true
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 10
        }
    }
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.shadowOffset = CGSize(width: 5, height: 5)
            button.layer.shadowRadius = 5
            button.layer.shadowOpacity = 0.3
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0,
                                     width: self.view.bounds.size.width,
                                     //height: 20 + 50 + imageView.frame.size.height / 2)
                                     height: self.view.bounds.size.height)
        configShapeLayer(shapeLayer)
        configShapeLayer(overShapeLayer)
        
    }
    
    func configShapeLayer(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 123, y: self.view.frame.height - 175))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 123, y: self.view.frame.height - 175))
        shapeLayer.path = path.cgPath
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        
        overShapeLayer = CAShapeLayer()
        view.layer.addSublayer(overShapeLayer)
    }
    
    @IBAction func tapped(_ sender: UIButton) {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 5
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.fillMode = kCAFillModeBoth
        animation.isRemovedOnCompletion = false
        
        animation.delegate = self
        
        overShapeLayer.add(animation, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        performSegue(withIdentifier: "showSecondScreen", sender: self)
    }
}
