//
//  LevelsTableViewCell.swift
//  LogosApp
//
//  Created by ioshellboy on 06/07/19.
//  Copyright © 2019 ioshellboy. All rights reserved.
//

import UIKit

class LevelsTableViewCell: UITableViewCell {

    @IBOutlet weak var levelTitle: UILabel!
    @IBOutlet weak var levelStatus: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(levelTitle: String, levelStatus: String) {
        self.levelTitle.text = levelTitle
        self.levelStatus.text = levelStatus
    }
    
    
}
