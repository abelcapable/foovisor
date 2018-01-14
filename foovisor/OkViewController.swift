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
    
    var menus:[[GetFoodResponse]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BrickCell", for: indexPath) as! BrickTableViewCell
        cell.selectionStyle = .none
        
        let menu = menus[indexPath.row]
        
        cell.labelMenu.text =  "Menu \(indexPath.row + 1)"
        
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
            cell.labelCalories.textColor = Colors.getGreenColor()
            
        case 400 ... 449:
            cell.labelCalories.text = "B: +/- 20%"
            cell.labelCalories.textColor = Colors.getBColor()

        case 550 ... 599:
            cell.labelCalories.text = "B: +/- 20%"
            cell.labelCalories.textColor = Colors.getBColor()
            
        case 350 ... 399:
            cell.labelCalories.text = "C: +/- 30%"
            cell.labelCalories.textColor = Colors.getCColor()
        case 600 ... 649:
            cell.labelCalories.text = "C: +/- 30%"
            cell.labelCalories.textColor = Colors.getCColor()
            
        case 300 ... 349:
            cell.labelCalories.text = "D: +/- 40%"
            cell.labelCalories.textColor = Colors.getDColor()
            
        case 650 ... 699:
            cell.labelCalories.text = "D: +/- 40%"
            cell.labelCalories.textColor = Colors.getDColor()
            
        default:
            cell.labelCalories.text = "E - more than 40% difference"
            cell.labelCalories.textColor = Colors.getEColor()
        
        }
        
        //-images
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
        
        //-names
        if let name = menu[0].display_name {
            cell.labelFood1.text = name
        }
        
        if let name = menu[1].display_name {
            cell.labelFood2.text = name
        }
        
        if let name = menu[2].display_name {
            cell.labelFood3.text = name
        }
        
        //-cals
        if let cal = menu[0].cal{
            cell.labelCal1.text = "\(cal) kcal"
        }
        
        if let cal = menu[1].cal{
            cell.labelCal2.text = "\(cal) kcal"
        }
        
        if let cal = menu[2].cal{
            cell.labelCal3.text = "\(cal) kcal"
        }
        
        return cell
    }
    
}
