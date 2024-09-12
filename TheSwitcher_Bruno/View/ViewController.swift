//
//  ViewController.swift
//  TheSwitcher_Bruno
//
//  Created by Bruno Madeira on 12/09/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var lightTableView: UITableView!
    let viewModel = MainViewModel()
    var customNavigationBar: UINavigationBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lightTableView.register(UINib(nibName: "CustomSwitchCell", bundle: nil), forCellReuseIdentifier: "CustomSwitchCell")
                
        lightTableView.delegate = self
        lightTableView.dataSource = self
        lightTableView.reloadData()
    
        styleUI()
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Ajustar o frame da NavigationBar para ignorar a Safe Area
        if let navBar = self.navigationController?.navigationBar {
            var frame = navBar.frame
            let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
            frame.origin.y = -statusBarHeight // Mover a NavigationBar para cima
            navBar.frame = frame
        }
    }
    
    func styleUI() {
        navigationItem.title = "The Switcher"
        navigationController?.navigationBar.backgroundColor = UIColor(hex: "7D9F59")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Usar uma célula UITableViewCell padrão
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomSwitchCell", for: indexPath) as! CustomSwitchCell
        
        let item = viewModel.getItem(at: indexPath.row)
        
        // Preencher a célula com dados placeholder
        cell.switchLbl.text = item.title
        cell.switcher.isOn = item.isSwitchOn
        cell.switcher.tag = indexPath.row
        cell.switcher.addTarget(self, action: #selector(switchChanged(_:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.getItem(at: indexPath.row)
        let selectedRoom = item.title
        lightTableView.reloadRows(at: [indexPath], with: .fade)
        
        performSegue(withIdentifier: "showDetail", sender: (isSwitchOn: viewModel.items[indexPath.row].isSwitchOn, roomName: selectedRoom))
    }
    
    @objc func switchChanged(_ sender: UISwitch) {
        
        let index = sender.tag
        viewModel.updateSwitchState(at: index, isOn: sender.isOn)
        
        let indexPath = IndexPath(row: sender.tag, section: 0)
        lightTableView.reloadRows(at: [indexPath], with: .none)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let detailVC = segue.destination as? DetailViewController,
               let data = sender as? (isSwitchOn: Bool, roomName: String) {
                let detailViewModel = DetailViewModel(isSwitchOn: data.isSwitchOn, roomSelected: data.roomName)
                detailVC.viewModel = detailViewModel
            }
        }
    }
}


extension UIColor {
    // Inicializador para converter hexadecimal em UIColor
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb >> 16) & 0xFF) / 255.0
        let green = CGFloat((rgb >> 8) & 0xFF) / 255.0
        let blue = CGFloat(rgb & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
