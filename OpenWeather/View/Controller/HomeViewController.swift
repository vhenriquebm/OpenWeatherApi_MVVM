//
//  ViewController.swift
//  OpenWeather
//
//  Created by vitor henrique on 06/09/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Constants
    
    private var citieslist:[City] = []
    var vm: ViewModelProtocol?
    
    //MARK: - Properties
    
    @IBOutlet weak var table: UITableView!

    //MARK: - Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVm()
        configureUI()
        getCities()
        
    }
    
    //MARK: - Private methods
    private func configureUI() {
        table.delegate = self
        table.dataSource = self
        
    }
    
    private func getCities () {
        vm?.getCitesData { cities in
            self.citieslist = cities
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
    
    private func configureVm () {
        self.vm = ViewModel()
    }
}

//MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {return}
        
        controller.city = citieslist[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citieslist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier) as? CityTableViewCell  {
            
            let index = indexPath.row
            cell.cityName.text = citieslist[index].cidade
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Cidades"
    }
}
