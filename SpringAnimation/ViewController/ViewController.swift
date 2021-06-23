//
//  ViewController.swift
//  SpringAnimation
//
//  Created by NIKOLAY OSIPOV on 22.06.2021.
//

import UIKit
import Spring

class ViewController: UIViewController {
    // MARK: - IB Outlets
    
    @IBOutlet weak var springView: SpringView!
    
    @IBOutlet weak var animationButton: UIButton!
    @IBOutlet weak var currentAnimationLabel: UILabel!
    @IBOutlet weak var currentCurveLabel: UILabel!
    // MARK: - Public Properties
    
    let animations = Animation.allCases
    
    var animation: Animation = .shake
    var index = 0
    // MARK: - Life Cycles Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        springView.curve = "easeInOut"
        currentAnimationLabel.text = "Current animation is"
        currentCurveLabel.text = "Current curve is"
        
    }
    // MARK: - IB Actions
    
    @IBAction func animationButtonTapped(_ sender: UIButton) {
        createNewAnimation()
        
        springView.animation = animation.rawValue
        springView.animate()
        animationButton.titleLabel?.text = "Hello"
        
    }
    
    // MARK: - Private Methods
    
    private func createNewAnimation() {
        if animations.count < index {
            index = 0
        }
        animation = animations[index]
        changeNameAnimation(index: index)
        
        index += 1
    }
    
    
    private func changeNameAnimation(index: Int) {
        let currentCurve = springView.curve
        let currentAntimation = animations[index].rawValue
        
        var nextAnimation: String = animations[0].rawValue
        
        if animations.count > index + 1 {
            nextAnimation = animations[index + 1].rawValue
            print(nextAnimation)
        } else {
            nextAnimation = animations[0].rawValue
        }
        currentAnimationLabel.text = "Current animation is \(currentAntimation)"
        currentCurveLabel.text = "Current curve is \(currentCurve)"
        animationButton.setTitle("Next animation is \(nextAnimation)", for: .normal)
    }
}


