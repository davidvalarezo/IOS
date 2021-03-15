//
//  TagCell.swift
//  RadioStation
//
//  Created by David on 08/05/2020.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

class TagCell: UITableViewCell {

    @IBOutlet weak var inicialMusic: UILabel!
    @IBOutlet weak var nameMusic: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(tag : String) {
        nameMusic.text = tag
        inicialMusic.text = tag.prefix(1).uppercased();
        //inicialMusic.text = String(tag!.name.replacingOccurrences(of:"#", with:"").prefix(1).uppercased())
        //lbl_estaciones.text = "Nº Estaciones:" + String(tag!.stationcount)
    }

}
