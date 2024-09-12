//
//  MainViewModel.swift
//  TheSwitcher_Bruno
//
//  Created by Bruno Madeira on 12/09/2024.
//

import Foundation

class MainViewModel {
    
    var items: [SwitchItemModel] = [
        SwitchItemModel(title: "Item 1", isSwitchOn: false),
        SwitchItemModel(title: "Item 2", isSwitchOn: false),
        SwitchItemModel(title: "Item 3", isSwitchOn: false),
        SwitchItemModel(title: "Item 4", isSwitchOn: false)
    ]
    
    func getItem(at index: Int) -> SwitchItemModel {
        return items[index]
    }
    
    // Método para atualizar o estado do switch
    func updateSwitchState(at index: Int, isOn: Bool) {
        items[index].isSwitchOn = isOn
    }
}
