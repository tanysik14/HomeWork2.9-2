//
//  ColorViewController.swift
//  HomeWork2.3
//
//  Created by Tatsiana Pauliukova on 10.01.23.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setNewColor( r: Int, g: Int, b: Int)
}

class ColorViewController: UIViewController {
    
    
    @IBOutlet var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.delegate = self
    }
    
    
}

extension ColorViewController: SettingViewControllerDelegate {
    func setNewColor(r: Int, g: Int, b: Int) {
        colorView.backgroundColor = UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1)
    }

    
}
