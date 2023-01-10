//
//  ViewController.swift
//  HomeWork2.3
//
//  Created by Tatsiana Pauliukova on 8.11.22.
//

import UIKit

class SettingViewController: UIViewController {
    
    // MARK: - IB Outlet
    
    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var numberRedColor: UILabel!
    @IBOutlet var numberGreenColor: UILabel!
    @IBOutlet var numberBlueColor: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    
    var delegate: SettingViewControllerDelegate!
    
    
    // MARK: - IB Action
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColor.layer.cornerRadius = 10
        
        setupSlider(color: .red, slider: sliderRed)
        setupSlider(color: .green, slider: sliderGreen)
        setupSlider(color: .blue, slider: sliderBlue)
        
        sliderAction()
        paintingView()
       
    }
    
    
   @IBAction func sliderAction() {
       paintingView()
       
        numberRedColor.text = String(format: "%.2f", (sliderRed.value))
        numberBlueColor.text = String(format: "%.2f", (sliderBlue.value))
        numberGreenColor.text = String(format: "%.2f", (sliderGreen.value))
       
    }
    
    @IBAction func doneButton() {
        settingCollorView()
        view.endEditing(true)
        dismiss(animated: true)
    }
    
    
    
    
    // MARK: - private setup
    private func setupSlider(color: UIColor, slider: UISlider) {
        slider.value = 0
        slider.minimumTrackTintColor = color
    }
    
    private func paintingView() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1
        )
    }
    
    private func settingCollorView() {
        delegate.setNewColor(r: Int(CGFloat(sliderRed.value)), g: Int(CGFloat(sliderGreen.value)), b: Int(CGFloat(sliderBlue.value)))
    }
}


