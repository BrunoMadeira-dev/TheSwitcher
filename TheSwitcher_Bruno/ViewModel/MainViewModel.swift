//
//  MainViewModel.swift
//  TheSwitcher_Bruno
//
//  Created by Bruno Madeira on 12/09/2024.
//

import Foundation

class MainViewModel {
    
    var items: [SwitchItemModel] = [
        SwitchItemModel(title: "Kitchen", isSwitchOn: false),
        SwitchItemModel(title: "Living Room", isSwitchOn: false),
        SwitchItemModel(title: "Master Bedroom", isSwitchOn: false),
        SwitchItemModel(title: "Guest's Bedroom", isSwitchOn: false)
    ]
    
    func getItem(at index: Int) -> SwitchItemModel {
        return items[index]
    }
    
    // Método para atualizar o estado do switch
    func updateSwitchState(at index: Int, isOn: Bool) {
        items[index].isSwitchOn = isOn
    }
}
