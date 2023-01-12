//
//  ViewController.swift
//  HomeWork2.3
//
//  Created by Tatsiana Pauliukova on 8.11.22.
//

import UIKit

class SettingViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IB Outlet
    
    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var numberRedColor: UILabel!
    @IBOutlet var numberGreenColor: UILabel!
    @IBOutlet var numberBlueColor: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    @IBOutlet var textFieldRed: UITextField!
    @IBOutlet var textFieldGreen: UITextField!
    @IBOutlet var textFieldBlue: UITextField!
    
    
    // MARK: - Public Properties
    var colorVC: UIColor!
    var delegate: SettingViewControllerDelegate!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColor.backgroundColor = colorVC
        viewColor.layer.cornerRadius = 10
        
        setupSlider(color: .red, slider: sliderRed)
        setupSlider(color: .green, slider: sliderGreen)
        setupSlider(color: .blue, slider: sliderBlue)
        
        sliderAction()
        
        textFieldRed.delegate = self
        textFieldGreen.delegate = self
        textFieldBlue.delegate = self
        
        addDoneButtonTo(textFieldRed)
        addDoneButtonTo(textFieldGreen)
        addDoneButtonTo(textFieldBlue)
        
    }
    
    
    // MARK: - IB Action
    @IBAction func sliderAction() {
        paintingView()
        setupTextField()
        
        numberRedColor.text = String(format: "%.2f", (sliderRed.value))
        numberBlueColor.text = String(format: "%.2f", (sliderBlue.value))
        numberGreenColor.text = String(format: "%.2f", (sliderGreen.value))
        
    }
    
    
    @IBAction func doneButton() {
        delegate.setNewColor(color: viewColor.backgroundColor!)
        dismiss(animated: true)
    }
    
    
    // MARK: - private setup
    private func setupSlider(color: UIColor, slider: UISlider) {
        let ciColor = CIColor(color: colorVC)
        
        sliderRed.value = Float(ciColor.red)
        sliderGreen.value = Float(ciColor.green)
        sliderBlue.value = Float(ciColor.blue)
        
        slider.minimumTrackTintColor = color
    }
    
    
    private func setupTextField() {
        textFieldRed.text = String(format: "%.2f", (sliderRed.value))
        textFieldGreen.text = String(format: "%.2f", (sliderGreen.value))
        textFieldBlue.text = String(format: "%.2f", (sliderBlue.value))
        
    }
    
    private func paintingView() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1
        )
    }
    
    private func addDoneButtonTo(_ textField: UITextField) {
        let numberToolbar = UIToolbar()
        textField.inputAccessoryView = numberToolbar
        numberToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title:"Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        numberToolbar.items = [flexBarButton, doneButton]
        
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
}


// MARK: - UITextFieldDelegate

extension SettingViewController: UITextViewDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let setValue = Float(text) {
            switch textField {
            case textFieldRed:
                sliderRed.setValue(setValue, animated: true)
                numberRedColor.text = String(format: "%.2f", (sliderRed.value))
            case textFieldGreen:
                sliderGreen.setValue(setValue, animated: true)
                numberGreenColor.text = String(format: "%.2f", (sliderGreen.value))
            case textFieldBlue:
                sliderBlue.setValue(setValue, animated: true)
                numberBlueColor.text = String(format: "%.2f", (sliderGreen.value))
            default:
                return
            }
        }
        paintingView()
    }
    
}
    


   
