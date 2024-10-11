//
//  FoodTruckTableViewCell.swift
//  FoodTrucks
//
//  Created by Nandkishore Kanhere on 9/17/23.
//

import UIKit

class FoodTruckTableViewCell: UITableViewCell {

    @IBOutlet weak var applicantLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var optionalTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func updateCellView(foodTruckModel: FoodTruckModel) {
        applicantLabel.text = foodTruckModel.applicant
        locationLabel.text = foodTruckModel.location
        hoursLabel.text = foodTruckModel.startTime + " " + "-" + " " + foodTruckModel.endTime
        optionalTextLabel.text = foodTruckModel.optionalText
    }
}

