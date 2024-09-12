//
//  DetailViewModel.swift
//  TheSwitcher_Bruno
//
//  Created by Bruno Madeira on 12/09/2024.
//

import Foundation

class DetailViewModel {
    var isSwitchOn: Bool = false
    var roomSelected: String = ""
    
    init(isSwitchOn: Bool, roomSelected: String) {
        self.isSwitchOn = isSwitchOn
        self.roomSelected = roomSelected
    }
    
    func switchStateText() -> String {
        return isSwitchOn ? "Switch is ON" : "Switch is OFF"
    }
}
