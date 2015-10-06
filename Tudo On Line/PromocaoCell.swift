//
//  PromocaoCell.swift
//  Tudo On Line
//
//  Created by Douglas Taquary on 26/09/15.
//  Copyright © 2015 com.douglasalexandre. All rights reserved.
//

import UIKit

class PromocaoCell: UITableViewCell {

    @IBOutlet weak var distancia: UILabel!
    @IBOutlet weak var iconeDistanciaPromocao: UIImageView!
    @IBOutlet weak var logoRestaurantePromocao:
    CustomView!
    @IBOutlet weak var promocaoLabel: UILabel!
    @IBOutlet weak var circuloStatusDoRestaurante: CustomView!
    @IBOutlet weak var valorPromocao: UILabel!
    @IBOutlet weak var nomeDoRestaurante: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
