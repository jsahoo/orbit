//
//  ViewController.swift
//  Orbit
//
//  Created by Jonathan Sahoo on 4/29/15.
//  Copyright (c) 2015 Jonathan Sahoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let orbitPath = CALayer() //the path for the moon to follow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orbitPath.bounds = CGRectMake(0, 0, 200, 200)
        orbitPath.position = self.view.center
        
        let moon = CALayer() //the moon
        moon.bounds = CGRectMake(0, 0, 90, 90)
        moon.contents = UIImage(named: "moon")?.CGImage
        orbitPath.addSublayer(moon)
        
        let animation = CABasicAnimation(keyPath: "transform.rotation") //the animation to move the moon along the orbit path
        animation.fromValue = NSNumber(double: 0) //go from 0 degrees
        animation.toValue = NSNumber(double: 2 * 3.14) //to 360 degrees (2 radians)
        animation.repeatCount = 100
        animation.duration = 10
        orbitPath.addAnimation(animation, forKey: "animate")
        
        self.view.layer.addSublayer(orbitPath)
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        
        let bound = CGFloat(sender.value)
        orbitPath.bounds = CGRectMake(0, 0, bound, bound)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

