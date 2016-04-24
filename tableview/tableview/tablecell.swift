//
//  tablecell.swift
//  tableview
//
//  Created by GuruUgam on 4/24/16.
//  Copyright © 2016 GuruUgam. All rights reserved.
//

import UIKit

class tablecell: UITableViewCell {

    @IBOutlet weak var lblname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
