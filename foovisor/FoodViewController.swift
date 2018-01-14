//
//  FoodViewController.swift
//  foovisor
//
//  Created by Abel Molnar on 2018. 01. 10..
//  Copyright © 2018. Abel Molnar. All rights reserved.
//

import UIKit
import Kingfisher

class FoodViewController: UIViewController, ServiceDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let service:Service = Service()
    var foods:[GetFoodResponse] = []
    let total = 100.0
    
    var isExpandedSet:Set<Int> = Set<Int>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initService()
        service.getFoodRequest()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // MARK: - Table view data source
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodTableViewCell
        cell.selectionStyle = .none
        
        
        if isExpandedSet.contains(indexPath.row) {
            cell.isExpanded = true
        } else {
            cell.isExpanded = false
        }
        
        
        let food:GetFoodResponse = foods[indexPath.row]
        
        if let url = food.imgUrl {
            if let u = URL(string: url) {
                cell.imageFood.kf.setImage(with: u)
            }
        }
        
        if let name = food.display_name {
            cell.lblFoodName.text = name
           
        }
        
        if let fat = food.lipids {
            cell.lblFat.text =  String(Int(fat))
        }
    
        if let proteins = food.proteins {
            cell.lblProteins.text = String(proteins)
            cell.circularProteins.setProgress(value: CGFloat(Double(proteins)), animationDuration: 2.0)
        }
        
        if let carbs = food.carbs  {
            cell.lblCarbs.text = String(Int(carbs))
            cell.circularCarbs.setProgress(value: CGFloat(Int(carbs/100)), animationDuration: 2.0)
        }
        
        if let fibers = food.fibers {
            cell.lblFibers.text = String(fibers)
            cell.circularFibers.setProgress(value: CGFloat(Double(fibers)), animationDuration: 2.0)
        }
        
        
        if let total = food.cal {
            cell.lblTotal.text = String(total)
            cell.circularTotal.setProgress(value: CGFloat(Double(total)/5), animationDuration: 2.0)
            
             cell.lblCellCals.text = "\(total) kcal"
        }
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? FoodTableViewCell
            else { return }
        

        if isExpandedSet.contains(indexPath.row) {
            isExpandedSet.remove(indexPath.row)
        } else {
            isExpandedSet.insert(indexPath.row)
        }
        
        tableView.beginUpdates()
        cell.isExpanded = !cell.isExpanded
        tableView.endUpdates()
    
    }
    
    

    
    func initService() {
        service.delegate = self
    }
    
    func serviceDataDownloadSuccess(type: ServiceType, data: AnyObject) {
        switch type {
        case .GetFoodRequest:
            if let foods:[GetFoodResponse] = data as? [GetFoodResponse] {
                DataManager.foods = foods
                self.foods = foods
                tableView.reloadData()
                
                
            } else {
                print("Cant get foods")
            }
            break
       
        }
        
    }
    
    func serviceDataDownloadFailed(type: ServiceType, errorCode: Int, errorMessage: String) {
        
    }

 
}
