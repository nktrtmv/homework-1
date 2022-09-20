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
        var hex, hexc : String
        while colors.count < views.count {
            hex = getRandomHex()
            hexc = String(hex[hex.index(hex.startIndex, offsetBy: 1)...])
            let scan = Scanner(string: hexc)
            var num: UInt64 = 0
            scan.scanHexInt64(&num)
            colors.insert(UIColor(red: CGFloat((num & 0xff000000) >> 24) / 255,
                                  green: CGFloat((num & 0x00ff0000) >> 16) / 255,
                                  blue: CGFloat((num & 0x0000ff00) >> 8) / 255,
                                  alpha: CGFloat(num & 0x000000ff) / 255))
        }
        return colors
    }
    
    
    func getRandomHex() -> String {
        var color = "#"
        let numbers = [0,1,2,3,4,5,6, 7, 8, 9]
        let letters = ["a","b","c","d","e","f"]
        while color.count < 9{
            color += Int.random(in: 0..<2) == 0
            ? String(numbers[Int.random(in: 0..<10)])
            : String(letters[Int.random(in: 0..<6)])
        }
        return color
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

