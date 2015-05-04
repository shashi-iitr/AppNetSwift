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
        self.sourceLabel.textColor = UIColor.redColor()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureCell(response: Model) {
        self.nameLabel.text = response.name
        self.sourceLabel.text = response.sourceUrl
        self.messageLabel.text = response.text
        self.dateLabel.text = response.createdAt
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
