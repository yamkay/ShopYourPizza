//
//  ViewController.swift
//  ShopYourPizza
//
//  Created by Selvaraj, Mohan on 6/9/19.
//  Copyright © 2019 YAMKAY. All rights reserved.
//

import UIKit

class PizzaListViewController: UITableViewController {
    
    let session : URLSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    var categoryKeys: [String]?
    var categoryValues: [[Pizza]]?
    var categoryList: CategoryList? {
        didSet {
            if let keys = categoryList?.categories?.keys {
                categoryKeys = Array(keys)
            }
            
            if let values = categoryList?.categories?.values {
                categoryValues = Array(values)
            }
            
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadPizzaInformation()

    }
    
    //MARK: Webservice call to fetch Pizza information
    
    func loadPizzaInformation() {
        dataTask?.cancel()
        
        let url = URL(string: "https://api.myjson.com/bins/snyji")
        dataTask = session.dataTask(with: url!) { [weak self] (data, response, error) in
            guard let data = data else {
                if let errorMessage = error?.localizedDescription {
                    fatalError("Unable to load Pizza information from server - \(errorMessage)")
                }
                return
            }
            
            let clist: CategoryList?
            
            do {
                clist = try JSONDecoder().decode(CategoryList.self, from: data)
            } catch {
                clist = nil
            }
            
            DispatchQueue.main.async {
                self?.categoryList = clist
            }
            
        }
        
        dataTask?.resume()
    }
    
}

//MARK:  UITableViewDataSource

extension PizzaListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let keys = categoryKeys else {
            return 0
        }
        return keys.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let values = categoryValues else {
            return 0
        }
        
        return values[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pizzaListCell") as! PizzaTableViewCell
        cell.pizza = categoryValues?[indexPath.section][indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label  = UILabel(frame: CGRect(origin: CGPoint(x: 10, y: 10), size: CGSize.zero))
        label.text = Array(categoryList!.categories!.keys)[section].uppercased()
        label.backgroundColor = UIColor.lightGray
        return label
    }
    
}

//MARK:  UITableViewDelegate

extension PizzaListViewController {
    
}


