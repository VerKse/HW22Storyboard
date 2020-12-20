//
//  WelcomeViewController.swift
//  HW22Storyboard
//
//  Created by Вера Ксенофонтова on 20.12.2020.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    //MARK: вот такой костыль, чтобы полупрозрачные цвета отображались красиво
    lazy var backgroundView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 15
        view.backgroundColor = .white
        view.addSubview(backgroundView)
        view.bringSubviewToFront(button)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        if let newVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            newVC.modalTransitionStyle = .crossDissolve
            newVC.modalPresentationStyle = .overCurrentContext
            newVC.delegate = self
            present(newVC, animated: false, completion: nil)
        }
    }
    
}

extension WelcomeViewController: ViewColorDelegate {
    
    func saveColor(color: UIColor) {
        backgroundView.backgroundColor = color
    }
    
}
