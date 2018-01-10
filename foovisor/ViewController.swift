//
//  ViewController.swift
//  foovisor
//
//  Created by Abel Molnar on 2018. 01. 10..
//  Copyright © 2018. Abel Molnar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var cView: UIView!
    @IBOutlet var btns: [UIButton]!
   

    var tab0: UIViewController!
    var tab1: UIViewController!
    var tab2: UIViewController!
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
    @IBAction func didTab(_ sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        btns[previousIndex].isSelected = false
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        
        sender.isSelected = true
        
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        vc.view.frame = cView.bounds
        cView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        tab0 = storyboard.instantiateViewController(withIdentifier: "tab0")
        tab1 = storyboard.instantiateViewController(withIdentifier: "tab1")
        tab2 = storyboard.instantiateViewController(withIdentifier: "tab2")
        
        
        viewControllers = [tab0, tab1, tab2]
        
        
        btns[selectedIndex].isSelected = true
        didTab(btns[selectedIndex])
        
        
        
    }


}

