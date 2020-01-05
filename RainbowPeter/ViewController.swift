//
//  ViewController.swift
//  RainbowPeter
//
//  Created by mac on 2020/1/5.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var gridSwitch: UISwitch!
    
    //漸層:頭髮和褲子
    @IBOutlet weak var gradientHeadView: UIView!
    @IBOutlet weak var gradientPantsView: UIView!
    
    //PartA:head,pants
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var pantsImage: UIImageView!
    
    @IBOutlet weak var redASlider: UISlider!
    @IBOutlet weak var greenASlider: UISlider!
    @IBOutlet weak var blueASlider: UISlider!
    @IBOutlet weak var alphaASlider: UISlider!
    @IBOutlet weak var gradientASlider: UISlider!
    
    
    //PartB:middle,shoes
    @IBOutlet weak var middleImage: UIImageView!
    @IBOutlet weak var shoesImage: UIImageView!
    
    @IBOutlet weak var redBSlider: UISlider!
    @IBOutlet weak var greenBSlider: UISlider!
    @IBOutlet weak var blueBSlider: UISlider!
    @IBOutlet weak var alphaBSlider: UISlider!
    @IBOutlet weak var gradientBSlider: UISlider!
    
    
    
     override func viewDidLoad() {
         super.viewDidLoad()

         // Do any additional setup after loading the view.
     }
     
     
    //PartA:頭髮褲子調色
    @IBAction func changeASlider(_ sender: Any) {
        
        headImage.backgroundColor = UIColor(red:CGFloat(redASlider.value), green:CGFloat(greenASlider.value), blue:CGFloat(blueASlider.value), alpha: CGFloat(alphaASlider.value))
        
        pantsImage.backgroundColor = UIColor(red:CGFloat(redASlider.value), green:CGFloat(greenASlider.value), blue:CGFloat(blueASlider.value), alpha: CGFloat(alphaASlider.value))
    }
    
    
    //PartB:衣服和鞋子調色
    @IBAction func changeBSlider(_ sender: Any) {
        
        middleImage.backgroundColor = UIColor(red:CGFloat(redBSlider.value), green:CGFloat(greenBSlider.value), blue:CGFloat(blueBSlider.value), alpha: CGFloat(alphaBSlider.value))
        
        shoesImage.backgroundColor = UIColor(red:CGFloat(redBSlider.value), green:CGFloat(greenBSlider.value), blue:CGFloat(blueBSlider.value), alpha: CGFloat(alphaBSlider.value))
    }
    
    
    //隨機顏色
    @IBAction func changeRandomButton(_ sender: Any) {

        let r1 = Double.random(in: 0...1)
        let r2 = Double.random(in: 0...1)
        let r3 = Double.random(in: 0...1)
        let r4 = Double.random(in: 0...1)
        let a = Double.random(in: 0...1)

        headImage.backgroundColor = UIColor(
            red: CGFloat(r1),
            green: CGFloat(r2),
            blue: CGFloat(r3),
            alpha: CGFloat(a))
        redASlider.value = Float(r1)
        greenASlider.value = Float(r2)
        blueASlider.value = Float(r3)
        alphaASlider.value = Float(a)
        
        middleImage.backgroundColor = UIColor(
                 red: CGFloat(r2),
                 green: CGFloat(r3),
                 blue: CGFloat(r4),
                 alpha: CGFloat(a))
        redBSlider.value = Float(r2)
        greenBSlider.value = Float(r3)
        blueBSlider.value = Float(r4)
        alphaBSlider.value = Float(a)

        pantsImage.backgroundColor = UIColor(
                  red: CGFloat(r3),
                  green: CGFloat(r4),
                  blue: CGFloat(r1),
                  alpha: CGFloat(a))
        redASlider.value = Float(r3)
        greenASlider.value = Float(r4)
        blueASlider.value = Float(r1)
        alphaASlider.value = Float(a)
        

        shoesImage.backgroundColor = UIColor(
                  red: CGFloat(r4),
                  green: CGFloat(r1),
                  blue: CGFloat(r2),
                  alpha: CGFloat(a))
        redBSlider.value = Float(r4)
        greenBSlider.value = Float(r1)
        blueBSlider.value = Float(r2)
        alphaBSlider.value = Float(a)

        

    }

    //清空顏色
    @IBAction func clearButtom(_ sender: Any) {
        headImage.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        middleImage.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        pantsImage.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        shoesImage.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        gradientHeadView.layer.sublayers?.removeAll()
        gradientPantsView.layer.sublayers?.removeAll()
       
        redASlider.value = 0
        greenASlider.value = 0
        blueASlider.value = 0
        alphaASlider.value = 0
        gradientASlider.value = 0
        redBSlider.value = 0
        greenBSlider.value = 0
        blueBSlider.value = 0
        alphaBSlider.value = 0
        gradientBSlider.value = 0
    }
    
//    @IBAction func changeSwitch(_ sender: UISwitch) {
//        if gridSwitch.isOn{
//            let image = UIImage(named: "middle")
//                let middleImageView = UIImageView(image: image)
//                let gridImageView = UIImageView(frame: middleImageView.frame)
//                gridImageView.image = UIImage(named: "redgrid.jpg")
//                gridImageView.addSubview(middleImageView)
//            gridImageView.isUserInteractionEnabled = true
//
//        }
    
    
     
       
    //左slider:頭髮漸層
    @IBAction func gradientActionSlider(_ sender: UISlider) {
        let locationTopA = round(15*gradientASlider.value)/15
        

        let gradientLayerH = CAGradientLayer()
        
        
        gradientLayerH.colors = [UIColor.systemPink.cgColor, UIColor.systemPurple.cgColor]
            gradientLayerH.frame = gradientHeadView.bounds
            gradientLayerH.locations = [0.0,NSNumber(value: locationTopA)]
            gradientHeadView.layer.addSublayer(gradientLayerH)
    }
    
    
    //右slider:褲子漸層
    @IBAction func gradientPantsActionSlider(_ sender: Any) {
        let locationTopB = round(15*gradientBSlider.value)/15
        let gradientLayerP = CAGradientLayer()
        gradientLayerP.colors = [UIColor.orange.cgColor, UIColor.blue.cgColor]
        gradientLayerP.frame = gradientPantsView.bounds
        gradientLayerP.locations = [0.0,NSNumber(value: locationTopB)]
        gradientPantsView.layer.addSublayer(gradientLayerP)
    }
    
    
    
}


