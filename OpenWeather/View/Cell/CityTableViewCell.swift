//
//  CityTableViewCell.swift
//  OpenWeather
//
//  Created by vitor henrique on 06/09/22.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    static let identifier: String = "CityTableViewCell"

    //MARK: - Properties
    
    @IBOutlet weak var cityName: UILabel!
    
    //MARK: - Initializers
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .white
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
