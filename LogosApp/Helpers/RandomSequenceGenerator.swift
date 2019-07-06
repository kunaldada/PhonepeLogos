//
//  RandomSequenceGenerator.swift
//  LogosApp
//
//  Created by ioshellboy on 06/07/19.
//  Copyright © 2019 ioshellboy. All rights reserved.
//

import UIKit

class RandomSequenceGenerator {
    static let totalLettersInRandomSequence: Int = 18
    static let allPermittedCharecters: [Character] =  (0..<26).map({Character(UnicodeScalar("A".unicodeScalars.first!.value + $0)!)})

    class func getRandomSequence(originalName: String) -> [Character] {
        var existingCharacters: [Character] = Array(originalName)
        var remainingCharacters = allPermittedCharecters.filter { !existingCharacters.contains($0) }
        let neededCharacters = totalLettersInRandomSequence - existingCharacters.count
        
        for _ in 0 ..< neededCharacters {
            let number = Int.random(in: 0 ..< remainingCharacters.count)
            existingCharacters.append(remainingCharacters[number])
            remainingCharacters.remove(at: number)
        }
        return existingCharacters.shuffled()
    }
}
