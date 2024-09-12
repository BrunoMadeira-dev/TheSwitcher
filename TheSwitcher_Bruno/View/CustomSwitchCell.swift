//
//  CustomSwitchCell.swift
//  TheSwitcher_Bruno
//
//  Created by Bruno Madeira on 12/09/2024.
//

import Foundation
import UIKit

class CustomSwitchCell: UITableViewCell {
    
    
    @IBOutlet weak var switchView: UIView!
    @IBOutlet weak var switchLbl: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomSwitchCell", bundle: nil)
    }
}
