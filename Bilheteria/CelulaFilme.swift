//
//  CelulaFilme.swift
//  Bilheteria
//
//  Created by Ronan on 8/13/16.
//  Copyright © 2016 Ronan. All rights reserved.
//

import UIKit

class CelulaFilme: UITableViewCell {

    @IBOutlet weak var imgFilme: UIImageView!
    @IBOutlet weak var dataFilme: UILabel!
    @IBOutlet weak var horaFilme: UILabel!
    @IBOutlet weak var nomeFilme: UILabel!
    @IBOutlet weak var valorFilme: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGrayColor().CGColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
        
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
