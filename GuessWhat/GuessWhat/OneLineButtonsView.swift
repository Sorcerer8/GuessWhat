//
//  OneLineButtonsView.swift
//  GuessWhat
//
//  Created by Dzmitry Shymanski on 1/8/18.
//  Copyright © 2018 Dzmitry Shymanski. All rights reserved.
//

import UIKit

protocol OneLineButtonsViewDelegate {
    
    func oneLineButtonsViewDelegateDidTapButton(sender: OneLineButtonsView!, buttonIndex: Int)
}

class OneLineButtonsView: UIView {
    
    var delegate : OneLineButtonsViewDelegate? = nil

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for subview in self.subviews
        {
            subview.layer.borderColor = UIColor.blue.cgColor
            subview.layer.borderWidth = 1
            
            if let button = subview as? UIButton
            {
                button.addTarget(self, action: #selector(buttonDidTouchDown(_:)), for: UIControlEvents.touchDown)
                button.addTarget(self, action: #selector(buttonDidTouchUpInside(_:)), for: UIControlEvents.touchUpInside)
                button.addTarget(self, action: #selector(buttonDidTouchUpOutside(_:)), for: UIControlEvents.touchUpOutside)
            }
        }
    }
    
    @objc func buttonDidTouchDown(_ sender: UIButton) {
        
        sender.layer.borderColor = UIColor.yellow.cgColor
    }
    
    @objc func buttonDidTouchUpInside(_ sender: UIButton) {
        
        sender.layer.borderColor = UIColor.blue.cgColor
        
        if let delegate = delegate
        {
            delegate.oneLineButtonsViewDelegateDidTapButton(sender: self, buttonIndex: sender.tag - 100)
        }
    }
    
    @objc func buttonDidTouchUpOutside(_ sender: UIButton) {
        
        sender.layer.borderColor = UIColor.blue.cgColor
    }
}
