//
//  weatherViewCell.swift
//  WeatherAPP_QiuyuZhang_135922193
//
//  Created by Qiuyu Zhang on 2022-03-20.
//

import UIKit

class weatherViewCell: UITableViewCell {

    @IBOutlet weak var lblWindSpeedAndDir: UILabel!
    
    @IBOutlet weak var lblCityNameAndTIme: UILabel!
    
    @IBOutlet weak var lblTemperature: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
