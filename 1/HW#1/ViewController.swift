//
//  ViewController.swift
//  HW#1
//
//  Created by Никита Артемов on 17.09.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var views: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var colors = getRandomColorsSet()
        for view in views{
            view.layer.cornerRadius = .random(in: 0...40)
            view.backgroundColor = colors.popFirst()
        }
    }
    
    func getRandomColorsSet() -> Set<UIColor>{
        var colors = Set<UIColor>()
        while colors.count < views.count {
            colors.insert(UIColor(
                red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: .random(in: 0...1),
                alpha: 1)
            )
        }
        return colors
    }
    
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        let button = sender as? UIButton
        button?.isEnabled = false
        var colors = getRandomColorsSet()
        
        UIView.animate(withDuration: 1.5, animations: {
            for view in self.views {
                view.backgroundColor = colors.popFirst()
                view.layer.cornerRadius = .random(in: 0...40)
            }
        }) {
            completion in button?.isEnabled = true
        }
    }
    
}

