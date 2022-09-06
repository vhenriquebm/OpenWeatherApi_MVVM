//
//  ViewController.swift
//  OpenWeather
//
//  Created by vitor henrique on 06/09/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let vm = ViewModel()
    
    
    
    //MARK: - Constants

    let citieslist = ["São Paulo","São Paulo","São Paulo","São Paulo","São Paulo"]
    
    //MARK: - Properties
    
    @IBOutlet weak var table: UITableView!

    //MARK: - Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
//        vm.fetchData(latitude: 10.99, longitude: 44.34)
        vm.getCitesData { cities in
            
            print (cities)
        }
    }
    
    //MARK: - Private methods
    private func configureUI() {
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .systemGray5
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citieslist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier) as? CityTableViewCell  {
            
            cell.cityName.text = "teste"
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
