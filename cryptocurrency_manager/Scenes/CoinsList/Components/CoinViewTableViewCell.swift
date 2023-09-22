//
//  CoinViewTableViewCell.swift
//  cryptocurrency_manager
//
//  Created by Caua Mistura on 21/09/23.
//

import UIKit

class CoinViewTableViewCell: UITableViewCell {
    static let indentifier = "CoinViewTableViewCell"
    
    @IBOutlet weak var hankLabel: UILabel!
    @IBOutlet weak var inconImage: UIImageView!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var marketCapLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
