//
//  EntryTableViewCell.swift
//  JBullet
//
//  Created by Desire Guilarte on 2020/2/12.
//  Copyright © 2020 DesGui. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var textTableViewCell: UILabel!
    @IBOutlet weak var typeTableViewCell: UIImageView!
    
    @IBOutlet weak var priorityTableViewCell: UIImageView!
    
    @IBOutlet weak var inspirationTableViewCell: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
