//
//  ViewController.swift
//  15_Animation
//
//  Created by Brennan Dumm on 2/3/23.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x:512, y: 384)
        view.addSubview(imageView)
    }

    @IBAction func Tapped(_ sender: UIButton) {
        sender.isHidden = true
   //     UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 5, animations: {
            switch self.currentAnimation {
            case 0:
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                break
            case 1:
                //UNDO previuos transform
                self.imageView.transform = .identity
                break
            case 2:
                self.imageView.transform = CGAffineTransform(translationX: -256, y: 256)
                break
            case 3:
                self.imageView.transform = .identity
                break
            case 4:
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi / 2.0)
                break
            case 5:
                self.imageView.transform = .identity
                break
            case 6:
                self.imageView.alpha = 0.1
                self.imageView.backgroundColor = .green
                break
            case 7:
                self.imageView.alpha = 1.0
                self.imageView.backgroundColor = .clear
                break
            default:
                print("")
            }
        }) {finished in
            print(finished)
            print(type(of: finished))
            sender.isHidden = false
        }
        
        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
        
        
        
        
    }

}

