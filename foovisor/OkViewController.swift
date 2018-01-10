//
//  OkViewController.swift
//  foovisor
//
//  Created by Abel Molnar on 2018. 01. 10..
//  Copyright © 2018. Abel Molnar. All rights reserved.
//

import UIKit

class OkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var foods:[GetFoodResponse] = []
    var menus:[[GetFoodResponse]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.foodsDownloaded), name:NSNotification.Name(rawValue: "foods_downloaded"), object: nil)
        
        if let _ = DataManager.foods {
            foodsDownloaded()
        }
        
    }
    
    @objc func foodsDownloaded() {
        
        foods = DataManager.foods!
        
        //starter, dish, dessert
        var starters:[GetFoodResponse] = []
        var dishes:[GetFoodResponse] = []
        var desserts:[GetFoodResponse] = []
        
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
        
        tableView.reloadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BrickCell", for: indexPath) as! BrickTableViewCell
        cell.selectionStyle = .none
        
        let menu = menus[indexPath.row]
        
        var cals = 0
        for food in menu {
            if let cal = food.cal {
                cals += cal
            }
        }
        
        cell.labelCalories.textColor = UIColor.red
        
        switch cals {
        case 450 ... 549:
            cell.labelCalories.text = "A: +/- 10%"
            cell.labelCalories.textColor = .green
            
        case 400 ... 449:
            cell.labelCalories.text = "B: +/- 20%"
             cell.labelCalories.textColor = UIColor.yellow

        case 550 ... 599:
            cell.labelCalories.text = "B: +/- 20%"
             cell.labelCalories.textColor = UIColor.yellow
            
        case 350 ... 399:
            cell.labelCalories.text = "C: +/- 30%"
        case 600 ... 649:
            cell.labelCalories.text = "C: +/- 30%"
            
        case 300 ... 349:
            cell.labelCalories.text = "D: +/- 40%"
        case 650 ... 699:
            cell.labelCalories.text = "D: +/- 40%"
            
        default:
            cell.labelCalories.text = "E - more than 40% difference "
        
        }
        
        
        
        if let url = menu[0].imgUrl {
            if let u = URL(string:url) {
                cell.imageFirst.kf.setImage(with:u)
            }
        }
        
        if let url = menu[1].imgUrl {
            if let u = URL(string:url) {
                cell.imageSecond.kf.setImage(with:u)
            }
        }
        
        if let url = menu[2].imgUrl {
            if let u = URL(string:url) {
                cell.imageThird.kf.setImage(with:u)
            }
        }
        
        if let name = menu[0].display_name {
            cell.label1.text = name
        }
        
        if let name = menu[1].display_name {
            cell.label2.text = name
        }
        
        if let name = menu[2].display_name {
            cell.label3.text = name
        }
        
        
        
        return cell
    }
    

}
