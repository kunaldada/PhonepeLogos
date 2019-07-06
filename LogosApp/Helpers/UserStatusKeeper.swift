//
//  UserStatusKeeper.swift
//  LogosApp
//
//  Created by ioshellboy on 06/07/19.
//  Copyright © 2019 ioshellboy. All rights reserved.
//

import UIKit

class UserStatusKeeper {

    static let shared = UserStatusKeeper()
    private var userModal: UserModal?
    
    private init() {
        
    }
    
    internal func getAllLevelStatus() -> [LevelStatus] {
        return self.userModal?.allLevelStatus ?? []
    }
    
}
