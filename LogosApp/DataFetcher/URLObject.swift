//
//  URLObject.swift
//  GoJekContacts
//
//  Created by ioshellboy on 06/07/19.
//  Copyright © 2019 ioshellboy. All rights reserved.
//

import UIKit


struct URLObject: DataRequestorProtocol {
    var urlString: String?
    var dataRequestType: DataRequestType = .get
    var appendedParameters: [String: Any]?
}
