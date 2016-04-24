//
//  ViewController.swift
//  tableview
//
//  Created by GuruUgam on 4/24/16.
//  Copyright © 2016 GuruUgam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var limit = NSInteger()
    var tblarray:NSArray = NSArray(objects: "1","2","sdfsa","sdfwefsdafasf","sdfasfwe","sdfwe","sdfwe","wewfsd")
    @IBOutlet weak var tblview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        limit = 3
        
        
        
        let dateString = "12-02-2026"
        let date = dateformatterDateString(dateString)
        
        print("today \(date)")
        
        let yesterday: NSDate = date!.dateByAddingTimeInterval(-86400.0)
        let tommorow: NSDate = date!.dateByAddingTimeInterval(86400.0)
        
        print("yesterday \(yesterday) tommoer \(tommorow)")

        
//        var thisWeek: NSDate = today.dateByAddingTimeInterval(-604800.0)
//        var lastWeek: NSDate = today.dateByAddingTimeInterval(-1209600.0)
//        var thisMonth: NSDate = today.dateByAddingTimeInterval(-2629743.83)
//        var lastMonth: NSDate = today.dateByAddingTimeInterval(-5259487.66)

        
        tblview.delegate = self
        tblview.dataSource = self
        tblview.registerNib(UINib(nibName: "tablecell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    func dateformatterDateString(dateString: NSString) -> NSDate?
    {
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return dateFormatter.dateFromString(dateString as String)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tblarray.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:tablecell! = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath:indexPath)as! tablecell
        // This function actually loads the xib
        if cell == nil{
            let cellnib = [NSBundle.mainBundle().loadNibNamed("tablecell", owner:self, options: nil)]
            cell = cellnib.first as? tablecell
        }
        cell.lblname.text = tblarray.objectAtIndex(indexPath.row) as? String
        return cell
    }
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        if let sr = tableView.indexPathsForSelectedRows {
            if sr.count == limit {
                let alertController = UIAlertController(title: "Oops", message:
                    "You are limited to \(limit) selections", preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in
                }))
                self.presentViewController(alertController, animated: true, completion: nil)
                
                return nil
            }
        }
        
        return indexPath
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //print("selected  \(intervalNames[indexPath.row])")
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if cell.selected {
                cell.accessoryType = .Checkmark
            }
        }
        
       
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
       // print("deselected  \(intervalNames[indexPath.row])")
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            cell.accessoryType = .None
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
