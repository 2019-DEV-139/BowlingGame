//
//  SimpleCalculator.swift
//  BowlingGame
//
//  Created by 2019_DEV_139 on 16/03/2019.
//  Copyright © 2019 2019_DEV_139. All rights reserved.
//

import Foundation

struct SimpleCalculator {
    //MARK:- Public method
    static func calculateScore(from game: String) throws -> Int {
        // Replace empty throws
        let gameWithEmptyScores = game.replacingOccurrences(of: "-", with: "0")
        
        // Remove spaces for easier enumeration and make uppercased for safety
        let gameArray = Array(gameWithEmptyScores.replacingOccurrences(of: " ", with: "").uppercased())
        
        var score = 0
        var frameIndex = 0
        // Go through frames and add scores
        repeat {
            if isStrike(frameIndex: frameIndex, array: gameArray) {
                score += strikeScore(from: frameIndex, in: gameArray)
                frameIndex += 1
            } else if isSpare(frameIndex: frameIndex, array: gameArray) {
                score += spareScore(from: frameIndex, in: gameArray)
            } else {
                score += regularScore(from: frameIndex, in: gameArray)
            }
            frameIndex += 2
        } while frameIndex < gameArray.count
        
        return score
    }
    
    //MARK:- Private methods
    static private func isStrike(frameIndex index: Int, array: [Character]) -> Bool {
        return false
    }
    
    static private func isSpare(frameIndex index: Int, array: [Character]) -> Bool {
        return false
    }
    
    static private func strikeScore(from index: Int, in array: [Character]) -> Int {
        return 10 // add next two throws
    }
    
    static private func spareScore(from index: Int, in array: [Character]) -> Int {
        return 10 // add next throw
    }
    
    static private func regularScore(from index: Int, in array: [Character]) -> Int {
        return 0
    }
}
