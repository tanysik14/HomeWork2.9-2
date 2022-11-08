//
//  ViewController.swift
//  HomeWork2.3
//
//  Created by Tatsiana Pauliukova on 8.11.22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IB Outlet
    
    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var numberRedColor: UILabel!
    @IBOutlet var numberGreenColor: UILabel!
    @IBOutlet var numberBlueColor: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    
    
    
    // MARK: - IB Action
    override func viewDidLoad() {
        super.viewDidLoad()
    viewColor.layer.cornerRadius = 10
//        paintingView()
        setupSlider()
        sliderAction()
     
    }
    
    
    @IBAction func sliderAction() {
        
        numberRedColor.text = String(format: "%.2f", (sliderRed.value))
        numberBlueColor.text = String(format: "%.2f", (sliderBlue.value))
        numberGreenColor.text = String(format: "%.2f", (sliderGreen.value))
        
    }
   
    
//    @IBAction func paintingView() {
//        var red = sliderRed.value
//        var blue = sliderBlue.value
//        var green = sliderGreen.value
//     
//        
//        viewColor.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(red))
//    }
   

// MARK: - private setup
    private func setupSlider() {
        sliderRed.value = 0
        sliderRed.minimumValue = 0
        sliderRed.maximumValue = 1
        sliderRed.minimumTrackTintColor = .red
        sliderGreen.value = 0
        sliderGreen.minimumValue = 0
        sliderGreen.maximumValue = 1
        sliderGreen.minimumTrackTintColor = .green
        sliderBlue.value = 0
        sliderBlue.minimumValue = 0
        sliderBlue.maximumValue = 1
        sliderBlue.minimumTrackTintColor = .blue
                                    
    }
}

