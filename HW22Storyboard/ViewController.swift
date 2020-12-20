//
//  ViewController.swift
//  HW22Storyboard
//
//  Created by Вера Ксенофонтова on 06.12.2020.
//

import UIKit

protocol ViewColorDelegate: AnyObject {
    
    func saveColor(color: UIColor)
}

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var alphaSwitcher: UISwitch!
    @IBOutlet weak var alphaStack: UIStackView!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var doneButton: UIButton!
    
    weak var delegate: ViewColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        colorView.layer.cornerRadius = 15
        doneButton.layer.cornerRadius = 15
        updateColorView()
        
    }
    
    @IBAction func alphaSliderAction(_ sender: Any) {
        updateColorView()
    }
    
    @IBAction func alphaSwitcherAction(_ sender: Any) {
        alphaStack.isHidden = !alphaSwitcher.isOn
        alphaSlider.value = 1
        updateColorView()
        
        //MARK: неудавшаяся попытка менять ограничения при скритии alphaSlider

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
    
    @IBAction func doneButtonAction(_ sender: Any) {
        UIView.animate(withDuration: 2) {
            self.doneButton.backgroundColor = self.colorView.backgroundColor
        }
        
        //MARK: как приостановить исполнение последующего кода, пока не закончится анимация?
        
        if let color = colorView.backgroundColor {
            delegate?.saveColor(color: color)
        }
        dismiss(animated: false, completion: nil)
        
    }
    
    func updateColorView() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255,
                                            green: CGFloat(greenSlider.value)/255,
                                            blue: CGFloat(blueSlider.value)/255,
                                            alpha: CGFloat(alphaSlider.value)
        )
    }
    
}

