//
//  ScoreCalculator.swift
//  LogosApp
//
//  Created by ioshellboy on 06/07/19.
//  Copyright © 2019 ioshellboy. All rights reserved.
//

import UIKit

class ScoreCalculator {

    class func calculateScore(userResponse: String, timeLeft: Int, actualLogoName: String, levelPoints: LevelPoints) -> Int {
        if userResponse == actualLogoName {
            let totalTime = levelPoints.totalTime
            let totalPoints = levelPoints.totalPoints
            let consumedTime = totalTime - timeLeft
            let pointsDeducted = Float(consumedTime) * levelPoints.decrementRatio
            let rewardedPoints = totalPoints - Int(pointsDeducted)
            return rewardedPoints
        }
        return 0
    }
}
