//
//  ViewController.swift
//  OpenWeather
//
//  Created by vitor henrique on 06/09/22.
//

import UIKit

class HomeViewController: UIViewController {
        
    //MARK: - Properties
    
    private var citieslist:[City] = []
    var delegate: HomeViewModelProtocol?
    
    @IBOutlet weak var table: UITableView!

    //MARK: - Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegates()
        getCities()
        self.title = LocalizableString.Home.view_tittle
    }
    
    //MARK: - Private methods
    
    private func getCities () {
        delegate?.getCitesData { cities in
            self.citieslist = cities
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
    
    private func configureDelegates () {
        self.delegate = HomeViewModel(apiService: ApiService())
        table.delegate = self
        table.dataSource = self
    }
}

//MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: LocalizableString.Details.controller_identifier) as? DetailViewController else {return}
        
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
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return LocalizableString.Home.table_tittle
    }
}
