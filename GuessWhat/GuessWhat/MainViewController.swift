//
//  ViewController.swift
//  GuessWhat
//
//  Created by Dzmitry Shymanski on 1/8/18.
//  Copyright © 2018 Dzmitry Shymanski. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, OneLineButtonsViewDelegate {

    @IBOutlet var buttonsContainerView: OneLineButtonsView!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var rightResultLabel : UILabel!
    
    var result: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsContainerView.delegate = self
    }    
    
    func oneLineButtonsViewDelegateDidTapButton(sender: OneLineButtonsView!, buttonIndex: Int)
    {
        let number = arc4random() % 3
        
        if (number == buttonIndex)
        {
            result += 1
        }
        else
        {
            result = 0
        }
        
        self.resultLabel.text = String(result)
        self.rightResultLabel.text = String(number)
    }
}

