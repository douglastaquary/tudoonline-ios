//
//  RestaurantesCell.swift
//  Tudo On Line
//
//  Created by Douglas Taquary on 26/09/15.
//  Copyright © 2015 com.douglasalexandre. All rights reserved.
//

import UIKit

class RestaurantesCell: UITableViewCell {

    @IBOutlet weak var logoRestaurante: CustomView!
    
    @IBOutlet weak var circuloStatus: CustomView!
    @IBOutlet weak var nomeRestaurante: UILabel!
    
    @IBOutlet weak var statusDorestaurante: UILabel!
    @IBOutlet weak var distancia: UILabel!
    @IBOutlet weak var categoria: UILabel!
    @IBOutlet weak var iconDistancia: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
