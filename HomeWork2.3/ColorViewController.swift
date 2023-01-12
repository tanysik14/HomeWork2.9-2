//
//  ColorViewController.swift
//  HomeWork2.3
//
//  Created by Tatsiana Pauliukova on 10.01.23.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setNewColor( color: UIColor)
}

class ColorViewController: UIViewController {
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.colorVC = view.backgroundColor
        settingVC.delegate = self
    }
}

// MARK: - SettingViewControllerDelegate
extension ColorViewController: SettingViewControllerDelegate {
    func setNewColor( color: UIColor) {
        view.backgroundColor = color
    }
}
