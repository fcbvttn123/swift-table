//
//  MyTableViewViewController.swift
//  w8l1
//
//  Created by Default User on 3/4/24.
//

import UIKit

class MyTableViewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var listData : Array<String> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        listData = ["Jays", "Leafs", "David", "Barca", "Real"]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        tableCell.textLabel?.text = listData[indexPath.row]
        
        tableCell.textLabel?.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        
        tableCell.accessoryType = .disclosureIndicator
        
        return tableCell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let more = UITableViewRowAction(style: .normal, title: "More", handler: {
            action, index in
            print("More button tapped")
        })
        more.backgroundColor = .lightGray
        
        let favorite = UITableViewRowAction(style: .normal, title: "Fovorite", handler: {
            action, index in
            print("Favorite button tapped")
        })
        favorite.backgroundColor = .orange
        
        let share = UITableViewRowAction(style: .normal, title: "Share", handler: {
            action, index in
            print("Share button tapped")
        })
        
        return [more, favorite, share]
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let modifyAction = UIContextualAction(style: .normal, title: "Modify", handler: {
            ac, vw, su in
            print("Modify Button tapped")
            su(true)
        })
        modifyAction.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [modifyAction])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
