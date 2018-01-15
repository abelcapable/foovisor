//
//  ViewController.swift
//  foovisor
//
//  Created by Abel Molnar on 2018. 01. 10..
//  Copyright © 2018. Abel Molnar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ServiceDelegate {

    
    @IBOutlet weak var cView: UIView!
    @IBOutlet var btns: [UIButton]!
    
    let service:Service = Service()

    var tab0: FoodViewController!
    var tab1: BrickViewController!
    var tab2: OkViewController!
    var viewControllers: [Any]!
    var selectedIndex: Int = 0
    
    var isSuceed = false
    
    @IBAction func didTab(_ sender: UIButton) {
        if isSuceed {
            let previousIndex = selectedIndex
            selectedIndex = sender.tag
            btns[previousIndex].isSelected = false
            let previousVC = viewControllers[previousIndex] as! UIViewController
            previousVC.willMove(toParentViewController: nil)
            previousVC.view.removeFromSuperview()
            previousVC.removeFromParentViewController()
        
        
            sender.isSelected = true
        
            let vc = viewControllers[selectedIndex] as! UIViewController
            addChildViewController(vc)
            vc.view.frame = cView.bounds
            cView.addSubview(vc.view)
            vc.didMove(toParentViewController: self)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        for btn in btns {
            btn.isHidden = true
        }
        
        initService()
        service.getFoodRequest()

    }
    
    func getMenus(foods:[GetFoodResponse]) -> [[GetFoodResponse]]{
        //starter, dish, dessert
        var starters:[GetFoodResponse] = []
        var dishes:[GetFoodResponse] = []
        var desserts:[GetFoodResponse] = []
        
        var menus:[[GetFoodResponse]] = []
        
        for food in foods {
            if let type = food.type {
                switch type {
                case "starter":
                    starters.append(food)
                case "dish":
                    dishes.append(food)
                case "desert":
                    desserts.append(food)
                default:
                    break
                }
            }
        }
        
        for starter in starters {
            for dish in dishes {
                for dessert in desserts {
                    var menu:[GetFoodResponse] = []
                    menu.append(starter)
                    menu.append(dish)
                    menu.append(dessert)
                    
                    menus.append(menu)
                }
            }
        }
        
        return menus
    }
    
    //MARK: retry alert
    func retryAlert(message:String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            // ...
            
        }
        alertController.addAction(cancelAction)
        
        let retryAction = UIAlertAction(title: "Retry", style: .default) { action in
            // ...
           
            self.service.getFoodRequest()
        }
        
        alertController.addAction(retryAction)
        
        
        self.present(alertController, animated: true) {
            // ...
        }
        
    }

    
    //MARK: Service delegates
    func initService() {
        service.delegate = self
    }
    
    func serviceDataDownloadSuccess(type: ServiceType, data: AnyObject) {
        switch type {
        case .GetFoodRequest:
            if let foods:[GetFoodResponse] = data as? [GetFoodResponse] {
                
                isSuceed = true
                
                let menus = getMenus(foods: foods)
                
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                tab0 = storyboard.instantiateViewController(withIdentifier: "tab0") as! FoodViewController
                tab1 = storyboard.instantiateViewController(withIdentifier: "tab1") as! BrickViewController
                tab2 = storyboard.instantiateViewController(withIdentifier: "tab2") as! OkViewController
                
                tab0.foods = foods
                tab1.menus = menus
                tab2.menus = menus
                
                viewControllers = [tab0, tab1, tab2]
                
                for btn in btns {
                    btn.isHidden = false
                }
                
                btns[selectedIndex].isSelected = true
                didTab(btns[selectedIndex])
                
                print("got foods")
            } else {
                print("Cant get foods")
            }
                
            break
            
        }
        
    }
    
    func serviceDataDownloadFailed(type: ServiceType, errorCode: Int, errorMessage: String) {
        print("service error: \(errorMessage)")
        retryAlert(message: errorMessage)
        
    }
    
}

