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
    var delegate: ViewModelProtocol?
    
    @IBOutlet weak var table: UITableView!

    //MARK: - Initializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegates()
        getCities()
        self.title = "Cidades"
        teste()
    }
    
    private func teste () {
        let date = Date.now
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "HH:mm"
        let formatted = formatter.string(from: date)
        print ("A data é \(formatted)")
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
        self.delegate = ViewModel()
        table.delegate = self
        table.dataSource = self
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
