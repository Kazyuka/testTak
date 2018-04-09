//
//  HomeCell.swift
//  test
//
//  Created by Руслан Казюка on 06.04.2018.
//  Copyright © 2018 Руслан Казюка. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    
    var data: DataModel! {
        didSet {
            configureCell()
        }
    }
    func configureCell() {
        numberLabel.text = String(describing: data!.numberElement!)
    }
}
