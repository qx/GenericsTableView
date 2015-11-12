//
//  ViewController.swift
//  IOS8SwiftTableViewTutorial
//
//  Created by Arthur Knopper on 20-06-14.
//  Copyright (c) 2014 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: BaseTableViewController<MySomeType> ,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var mytableview: UITableView!
    let tableData = ["One","Two","ThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThreeThree"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mytableview.estimatedRowHeight=300
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tableData.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        //		let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"cell")
        //
        //		cell.textLabel!.text = tableData[indexPath.row]
        //
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath:indexPath) as! CustomCell
        cell.contentLabel.text = tableData[indexPath.row] as String
        
        
        return cell
    }
    var customCell: CustomCell!
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if Constants.Devices.iOS8 {
            //            	println("UITableViewAutomaticDimension:\(UITableViewAutomaticDimension)")
            return UITableViewAutomaticDimension
        } else {
            if customCell == nil {
                customCell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomCell
            }
            return calculateHeightForConfiguredSizingCell(customCell)
        }
        
    }
    
    // MARK: - Tableview configuration cell
    
    
    
    private func calculateHeightForConfiguredSizingCell(sizingCell: CustomCell) -> CGFloat {
        sizingCell.bounds = CGRectMake(0.0, 0.0, CGRectGetWidth(mytableview.frame), CGRectGetHeight(sizingCell.bounds));
        sizingCell.setNeedsLayout()
        sizingCell.layoutIfNeeded()
        print(sizingCell.contentLabel!.bounds.height)
        let size = sizingCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingExpandedSize)
        return size.height + 1.0;
    }
    
    
}

