//
//  LevelDetailTableViewCell.swift
//  LogosApp
//
//  Created by ioshellboy on 06/07/19.
//  Copyright © 2019 ioshellboy. All rights reserved.
//

import UIKit

class LevelDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var logoStatusLabel: UILabel!
    
    private var logoModal: LogoModal?
    private var logoStatus: LogoStatus?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(logoModal: LogoModal, logoStatus: LogoStatus) {
        self.logoModal = logoModal
        self.logoStatus = logoStatus
        if let imageUrlStr = logoModal.imgUrl {
            let imageUrlObject = URLObject(urlString: imageUrlStr, dataRequestType: .get, appendedParameters: nil)
            DataFetcher.shared.fetchImage(dataRequestor: imageUrlObject, success: { (image, requestUrlString) -> (Void) in
                if requestUrlString == self.logoModal?.imgUrl {
                    self.logoImageView.image = image
                }
                else {
                    //do nothing
                }
            }, failure: nil)
        }
        self.logoStatusLabel.text = logoStatus.passedSuccessfully ? "Completed" : "Try Now !!"
    }
    
}

