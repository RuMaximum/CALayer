//
//  FirstViewController.swift
//  CALayer
//
//  Created by Maxim Dvortsov on 11.10.2017.
//  Copyright © 2017 Maxim Dvortsov. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,CAAnimationDelegate {
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.size.height / 2
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = 3
            imageView.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
    }
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 0.5)
            let firstColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor
            let secondColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1).cgColor
            gradientLayer.colors = [firstColor, secondColor]
        }
    }
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineCap = "round"
            shapeLayer.lineWidth = 20
            shapeLayer.strokeColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1).cgColor
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        didSet {
            overShapeLayer.lineCap = "round"
            overShapeLayer.lineWidth = 18
            overShapeLayer.strokeColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1).cgColor
            overShapeLayer.fillColor = nil
            overShapeLayer.strokeEnd = 0.3
        }
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        configShapeLayer(shapeLayer)
        configShapeLayer(overShapeLayer)
    }
    
    func configShapeLayer(_ shapeLayer: CAShapeLayer) {
        
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 2))
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
