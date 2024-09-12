//
//  DetailViewController.swift
//  TheSwitcher_Bruno
//
//  Created by Bruno Madeira on 12/09/2024.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageLight: UIImageView!
    @IBOutlet weak var roomLbl: UILabel!
    @IBOutlet weak var onOrOffLbl: UILabel!
    
    private let backButton = UIButton(type: .system)
    
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        imageLight.image = UIImage(named: viewModel?.isSwitchOn ?? false ? "light_Image_On" : "light_Image_Off")
        roomLbl.text = "Your \(viewModel?.roomSelected ?? "Unknown Room") light is"
        onOrOffLbl.text = viewModel?.isSwitchOn ?? false ? "ON" : "OFF"
        styleUI()
    }
    
    func styleUI() {
        
        navigationItem.title = viewModel?.roomSelected ?? "Unknown Room"
        
        // Criar um botão de voltar personalizado com título e ícone
        let backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        // Ajustar o layout do botão para ter texto e ícone juntos
        backButton.semanticContentAttribute = .forceLeftToRight
        backButton.sizeToFit()
        
        let backButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backButtonItem
        
        onOrOffLbl.font = UIFont.boldSystemFont(ofSize: 40)
    }
    
    @objc func backButtonPressed() {
            navigationController?.popViewController(animated: true)
    }
}
