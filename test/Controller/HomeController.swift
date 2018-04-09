//
//  HomeControllerViewController.swift
//  test
//
//  Created by Руслан Казюка on 06.04.2018.
//  Copyright © 2018 Руслан Казюка. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var undoBarButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    private let cellIdentifier = "Cell"
    private let lastRemoveNumber = "lastNumber"
    private let defaultValueForUserDefaults = 200
    
    private var dataArray = [DataModel]()
    var indicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    
    private var isUpdateUndoButton: Bool? {
        
        didSet {
            
            if isUpdateUndoButton! {
                self.undoBarButton.tintColor = UIColor.clear
                self.undoBarButton.isEnabled = false
            } else {
                self.undoBarButton.tintColor = UIColor.white
                self.undoBarButton.isEnabled = true
            }
        }
    }
    
    func setUpView() {
        
        tableView.separatorColor = UIColor.clear
        addActivityIndicator()
        UserDefaults.standard.set(defaultValueForUserDefaults, forKey: lastRemoveNumber)
        dataArray = DataModel.getNumbers()
        self.tableView.reloadData()
        isUpdateUndoButton = true
    }
    
    func addActivityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
}

// MARK: - Buttons actions.
extension HomeController {
    
    @IBAction func addNumberButtonClik(_ sender: Any) {
        self.indicator.startAnimating()
        DispatchQueue.global().async {
            let number = Int(arc4random_uniform(101))
            self.dataArray.append(DataModel(numberElement: number))
            self.dataArray = self.dataArray.sorted(by: { $0.numberElement! > $1.numberElement! })
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.indicator.stopAnimating()
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func undoButtonClick(_ sender: Any) {
        self.indicator.startAnimating()
        self.isUpdateUndoButton = true
        DispatchQueue.global().async {
            let lastNumber = UserDefaults.standard.integer(forKey: self.lastRemoveNumber)
            if lastNumber != self.defaultValueForUserDefaults {
                self.dataArray.append(DataModel(numberElement: lastNumber))
                self.dataArray = self.dataArray.sorted(by: { $0.numberElement! > $1.numberElement! })
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.indicator.stopAnimating()
                self.tableView.reloadData()
            }
        }
    }
}

 // MARK: Methods UITableViewDataSource, UITableViewDelegate.
extension HomeController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HomeCell
        cell?.data = dataArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let remove = UITableViewRowAction(style: .normal, title: "Remove") { (_, indexPath) in
            self.removeRowAtIndexPath(indexPath)
        }
        return [remove]
    }
    
    private func removeRowAtIndexPath(_ indexPath: IndexPath) {
        let lastNumber = dataArray[indexPath.item].numberElement
        dataArray.remove(at: indexPath.item)
        UserDefaults.standard.set(lastNumber, forKey: lastRemoveNumber)
        tableView.reloadData()
        isUpdateUndoButton = false
    }
}
