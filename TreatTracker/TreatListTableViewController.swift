//
//  TreatListTableViewController.swift
//  TreatTracker
//
//  Created by Chris Gonzales on 6/30/14.
//
//

import UIKit

class TreatListTableViewController: UITableViewController {
    let treatManager = TreatManager.sharedInstance

    
//    overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
//     TABLEVIEW DATA SOURCE

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return treatManager.treatCount
    }

    
    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        let cell = tableView!.dequeueReusableCellWithIdentifier("reusableCell", forIndexPath: indexPath!) as UITableViewCell

        let currentTreat = treatManager.treatList[indexPath!.row]
        cell.textLabel.text = currentTreat.name
        cell.detailTextLabel.text = String(currentTreat.count)
        cell.contentView.backgroundColor = currentTreat.color
        cell.textLabel.backgroundColor = UIColor.clearColor()
        cell.detailTextLabel.backgroundColor = UIColor.clearColor()
        return cell
    }

//      TABLEVIEW DELEGATE METHODS
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            treatManager.removeTreatAtIndex(indexPath!.row)
            tableView!.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView?, moveRowAtIndexPath fromIndexPath: NSIndexPath?, toIndexPath: NSIndexPath?) {
        var movedTreat = treatManager.treatList[fromIndexPath!.row]
        treatManager.removeTreatAtIndex(fromIndexPath!.row)
        treatManager.treatList.insert(movedTreat, atIndex: toIndexPath!.row)
    }

    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let selectedTreat = treatManager.treatList[indexPath.row]
        ++selectedTreat.count
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
    }

    
// #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        tableView.setEditing(false, animated: true)
        self.setEditing(false, animated: true)
    }
}
