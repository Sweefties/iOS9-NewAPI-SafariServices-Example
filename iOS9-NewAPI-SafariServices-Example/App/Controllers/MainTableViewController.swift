//
//  MainTableViewController.swift
//  iOS9-NewAPI-SafariServices-Example
//
//  Created by Wlad Dicario on 10/09/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import UIKit
import SafariServices

class MainTableViewController: UITableViewController {

    // MARK: - Properties
    private let cellIdentifier = "defaultCell"
    private var url:[String] = ["https://apple.com",
        "https://google.com",
        "https://github.com",
        "https://twitter.com",
        "https://facebook.com",
        "https://youtube.com"
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Formatted String for Cell Text Label
    /**
    scan url string
    
    - parameter str :String url to scan
    - returns: host domain as string
    */
    private func scanUrlString(str:String) -> String {
        let scan = NSScanner(string:str)
        var scanned: NSString?
        
        if scan.scanUpToString("://", intoString:nil) {
            scan.scanString("://", intoString:nil)
            if scan.scanUpToString(".", intoString:&scanned) {
                let result: String = scanned as! String
                return result
            }
        }
        return str
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return url.count ?? 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        // Configure the cell...
        cell.textLabel?.text = scanUrlString(url[indexPath.row] as String)
        return cell
    }

    // MARK: - Table view Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let weburl = url[indexPath.row]
        self.openUrlWithSafariVC(weburl)
    }
    
}

//MARK: - SafariDelegate -> MainTableViewController Extension
typealias SafariDelegate = MainTableViewController
extension SafariDelegate : SFSafariViewControllerDelegate {
    
    // dismiss SFSafariViewController (Done button)
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // present SFSafariViewController modally
    private func openUrlWithSafariVC(urlstring:String) {
        let sfvc = SFSafariViewController(URL: NSURL(string: urlstring)!, entersReaderIfAvailable: true)
        sfvc.delegate = self
        self.presentViewController(sfvc, animated: true, completion: nil)
    }
}
