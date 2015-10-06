//
//  MenuCell.swift
//  Tudo On Line
//
//  Created by Douglas Taquary on 26/09/15.
//  Copyright © 2015 com.douglasalexandre. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var imagemMenuCell: UIImageView!
    @IBOutlet weak var labelMenuCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
