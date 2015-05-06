//
//  ViewController.swift
//  AppNet
//
//  Created by shashi kumar on 04/05/15.
//  Copyright (c) 2015 shashi kumar. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var filteredResponses = [Model]()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        println("init with nib")
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self

        Alamofire.request(.GET, "https://alpha-api.app.net/stream/0/posts/stream/global").responseJSON() {
            (_, _, data, _) in
            var responses = data!.valueForKey("data") as! [NSDictionary]
            
            println(responses)
            for response in responses {
                var model = Model(name: response.valueForKeyPath("source.name") as! String, text: response.valueForKey("text") as! String, sourceUrl: response.valueForKey("canonical_url") as! String, imageUrl: response.valueForKeyPath("user.avatar_image.url") as! String, createdAt:response.valueForKey("created_at") as! String)
                self.filteredResponses.append(model)
            }
            self.tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredResponses.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DisplayTableViewCell
        cell.configureCell(self.filteredResponses[indexPath.row])
        return UITableViewCell()
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        tableView(tableview, didSelectRowAtIndexPath: indexPath)
//    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

