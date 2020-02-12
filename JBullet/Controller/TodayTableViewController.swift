//
//  TodayTableViewController.swift
//  JBullet
//
//  Created by Desire Guilarte on 2020/2/12.
//  Copyright © 2020 DesGui. All rights reserved.
//

import UIKit

class TodayTableViewController: UITableViewController {
    
    //MARK: Properties
    var entries: [Entry] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    //MARK: Actions
    @IBAction func unwindToTodayEntriesList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as?
            TodayEntryViewController, let entry = sourceViewController.entry{
            
            let newIndexPath = IndexPath(row: entries.count, section: 0)
            
            entries.append(entry)
            
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Table cells should be reused and dequeued using a cell identifier
        let cellIdentifier = "EntryTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EntryTableViewCell else {
            fatalError("The dequeued cell is not and instance of EntryTableViewCell ")
        }
        
        let entry = entries[indexPath.row]
        
        cell.textTableViewCell.text = entry.text
        cell.typeTableViewCell.image = UIImage(named: entry.type)
        if (entry.inspiration){
            cell.inspirationTableViewCell.image = UIImage(named: "inspiration")
        }
        if(entry.priority){
            cell.priorityTableViewCell.image = UIImage(named: "priority")
            
        }

        return cell
    }
 
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
