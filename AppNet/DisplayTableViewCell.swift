//
//  DisplayTableViewCell.swift
//  AppNet
//
//  Created by shashi kumar on 05/05/15.
//  Copyright (c) 2015 shashi kumar. All rights reserved.
//

import UIKit

class DisplayTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureCell(response: Model) {
        if var label = self.nameLabel {
            label.text = response.name
        }
        if var label = self.sourceLabel {
            label.text = response.sourceUrl
        }
        if var label = self.messageLabel {
            label.text = response.text
        }
        if var label = self.dateLabel {
            label.text = response.createdAt
        }

    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
