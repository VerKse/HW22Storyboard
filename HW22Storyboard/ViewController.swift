//
//  ViewController.swift
//  HW22Storyboard
//
//  Created by Вера Ксенофонтова on 06.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var alphaSwitcher: UISwitch!
    @IBOutlet weak var alphaStack: UIStackView!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        colorView.layer.cornerRadius = 15
        updateColorView()
        
    }
    
    @IBAction func alphaSliderAction(_ sender: Any) {
        updateColorView()
    }
    
    @IBAction func alphaSwitcherAction(_ sender: Any) {
        alphaStack.isHidden = !alphaSwitcher.isOn
    }
    
    @IBAction func redSliderAction(_ sender: Any) {
        updateColorView()
    }
    
    @IBAction func greenSliderAction(_ sender: Any) {
        updateColorView()
    }
    
    @IBAction func blueSliderAction(_ sender: Any) {
        updateColorView()
    }
    
    func updateColorView() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255,
                                            green: CGFloat(greenSlider.value)/255,
                                            blue: CGFloat(blueSlider.value)/255,
                                            alpha: CGFloat(alphaSlider.value)
        )
    }
    
}

