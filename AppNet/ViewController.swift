//
//  ViewController.swift
//  AppNet
//
//  Created by shashi kumar on 04/05/15.
//  Copyright (c) 2015 shashi kumar. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var filteredResponses = [Model]()
        Alamofire.request(.GET, "https://alpha-api.app.net/stream/0/posts/stream/global").responseJSON() {
            (_, _, data, _) in
            var responses = data!.valueForKey("data") as! [NSDictionary]
            
//            let dict = data as! [String: Array]()
            println(responses)
            
            for response in responses {
                
                var model = Model(name: response.valueForKeyPath("source.name") as! String, text: response.valueForKey("text") as! String, sourceUrl: response.valueForKey("canonical_url") as! String, imageUrl: response.valueForKeyPath("user.avatar_image.url") as! String, createdAt:response.valueForKey("created_at") as! String)
                filteredResponses.append(model)
            }
            
            println(filteredResponses)
//            for value in data {
//                println(value)
//            }
        }
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

