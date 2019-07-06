//
//  UserModal.swift
//  LogosApp
//
//  Created by ioshellboy on 06/07/19.
//  Copyright © 2019 ioshellboy. All rights reserved.
//

import UIKit

struct UserModal {
    var currentLevel: Int = 0
    var allLevelStatus: [LevelStatus] = []
    var totalScore: Int = 0
}

enum LevelStatusType {
    case locked, inProgress, completed
    
    var associatedString : String {
        switch self {
        case .locked:
            return "Locked"
        case .inProgress:
            return "InProgress"
        case .completed:
            return "Completed"
        }
    }
}

struct LevelStatus {
    var levelStatusType: LevelStatusType = .locked
    var logoStatus: [LogoStatus] = []
}

struct LogoStatus {
    var passedSuccessfully: Bool = false
    var successTime: Int = 0
    var successPointsEarned: Int = 0
}
