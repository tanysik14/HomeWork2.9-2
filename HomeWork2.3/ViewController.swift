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
        
        setupSlider()
        sliderAction()
        
    }
    
    
    @IBAction func sliderAction() {
        
        numberRedColor.text = String(format: "%.2f", (sliderRed.value))
        numberBlueColor.text = String(format: "%.2f", (sliderBlue.value))
        numberGreenColor.text = String(format: "%.2f", (sliderGreen.value))
        
        viewColor.backgroundColor = UIColor(red: CGFloat(sliderRed.value), green: CGFloat(sliderGreen.value), blue: CGFloat(sliderBlue.value), alpha: 1)
    }
    
    
    
    // MARK: - private setup
    private func setupSlider() {
        sliderRed.value = 0
        sliderRed.minimumTrackTintColor = .red
        sliderGreen.value = 0
        sliderGreen.minimumTrackTintColor = .green
        sliderBlue.value = 0
        sliderBlue.minimumTrackTintColor = .blue
    }
    
}

