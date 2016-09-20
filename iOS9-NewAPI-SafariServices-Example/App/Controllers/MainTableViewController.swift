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
    fileprivate let cellIdentifier = "defaultCell"
    fileprivate var url:[String] = ["https://apple.com",
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
    fileprivate func scanUrlString(_ str:String) -> String {
        let scan = Scanner(string:str)
        var scanned: NSString?
        
        if scan.scanUpTo("://", into:nil) {
            scan.scanString("://", into:nil)
            if scan.scanUpTo(".", into:&scanned) {
                let result: String = scanned as! String
                return result
            }
        }
        return str
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return url.count 
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = scanUrlString(url[(indexPath as NSIndexPath).row] as String)
        return cell
    }

    // MARK: - Table view Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weburl = url[(indexPath as NSIndexPath).row]
        self.openUrlWithSafariVC(weburl)
    }
    
}

//MARK: - SafariDelegate -> MainTableViewController Extension
typealias SafariDelegate = MainTableViewController
extension SafariDelegate : SFSafariViewControllerDelegate {
    
    // dismiss SFSafariViewController (Done button)
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    // present SFSafariViewController modally
    fileprivate func openUrlWithSafariVC(_ urlstring:String) {
        let sfvc = SFSafariViewController(url: URL(string: urlstring)!, entersReaderIfAvailable: true)
        sfvc.delegate = self
        self.present(sfvc, animated: true, completion: nil)
    }
}
