//
//  ViewController.swift
//  swift-github-demo
//
//  Created by fraserxu on 14-6-5.
//  Copyright (c) 2014年 fraserxu. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, APIControllerProtocol {
    
    var api: APIController = APIController()
    @IBOutlet var appsTableView : UITableView
    var tableData: NSArray = NSArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.api.delegate = self
        api.searchGithubFor("fraserxu");
    }
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        
        var rowData: NSDictionary = self.tableData[indexPath.row] as NSDictionary
        
        cell.text = rowData["name"] as String
        
        // Get the formatted price string for display in the subtitle
        var formattedPrice: NSString = rowData["description"] as NSString
        
        cell.detailTextLabel.text = formattedPrice
        
        return cell
    }
    
    func didRecieveAPIResults(results: NSArray) {
        self.tableData = results
        self.appsTableView.reloadData()
    }
}