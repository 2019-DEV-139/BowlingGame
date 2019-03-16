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
    static func calculateScore(from gameString: String) throws -> Int {
        let game = convertGameStringToValues(gameString)
        
        var score = 0
        var frameIndex = 0
        // Go through frames and add scores
        repeat {
            if isStrike(frameIndex: frameIndex, array: game) {
                score += strikeScore(from: frameIndex, in: game)
                frameIndex += 1
            } else if isSpare(frameIndex: frameIndex, array: game) {
                score += spareScore(from: frameIndex, in: game)
            } else {
                score += regularScore(from: frameIndex, in: game)
            }
            frameIndex += 2
        } while frameIndex < game.count
        
        return score
    }
    
    //MARK:- Private methods
    static func convertGameStringToValues(_ gameString: String) -> [Int] {
        
        // Remove spaces for easier enumeration and make uppercased for safety
        let shortenedGame = gameString.replacingOccurrences(of: " ", with: "").uppercased()
        
        // Replace empty throws
        let gameArray = Array(shortenedGame.replacingOccurrences(of: "-", with: "0"))
        
        // Translate strings to numerical values
        var game = [Int]()
        for roll in gameArray {
            if roll == "X" {
                game.append(10)
            } else if roll == "/" {
                game.append(10 - (game.last ?? 0))
            } else {
                game.append(Int(String(roll)) ?? 0)
            }
        }
        
        return game
    }
    
    static func isStrike(frameIndex index: Int, array: [Int]) -> Bool {
        return false
    }
    
    static func isSpare(frameIndex index: Int, array: [Int]) -> Bool {
        return false
    }
    
    static func strikeScore(from index: Int, in array: [Int]) -> Int {
        return 10 // add next two throws
    }
    
    static func spareScore(from index: Int, in array: [Int]) -> Int {
        return 10 // add next throw
    }
    
    static func regularScore(from index: Int, in array: [Int]) -> Int {
        return 0
    }
}
