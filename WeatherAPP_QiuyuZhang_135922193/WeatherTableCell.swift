//
//  WeatherTableCell.swift
//  WeatherAPP_QiuyuZhang_135922193
//
//  Created by Qiuyu Zhang on 2022-03-22.
//

import UIKit

class WeatherTableCell: UITableViewCell {

    @IBOutlet weak var cityNamelbl: UILabel!
    @IBOutlet weak var windlbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
