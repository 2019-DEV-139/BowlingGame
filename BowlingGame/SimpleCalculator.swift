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
    static func calculateScore(from gameString: String) -> Int {
        // Convert string game input to numerical value of each throw
        let game = convertGameStringToValues(gameString)
        
        var score = 0
        var frameIndex = 0
        var frames = 0
        // Go through frames and add scores
        repeat {
            frames += 1
            
            if isStrike(frameIndex: frameIndex, array: game) {
                score += strikeScore(from: frameIndex, in: game)
                frameIndex += 1
            } else if isSpare(frameIndex: frameIndex, array: game) {
                score += spareScore(from: frameIndex, in: game)
                frameIndex += 2
            } else {
                score += regularScore(from: frameIndex, in: game)
                frameIndex += 2
            }
            
        } while frames < 10
        
        return score
    }
    
    //MARK:- Private methods
    static func convertGameStringToValues(_ gameString: String) -> [Int] {
        
        // Remove spaces for easier enumeration and make uppercased for safety
        let shortenedGame = gameString.replacingOccurrences(of: " ", with: "").uppercased()
        
        // Replace empty throws with 0 value
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
    
    //MARK:- Frame types
    static func isStrike(frameIndex index: Int, array: [Int]) -> Bool {
        return array[index] == 10
    }
    
    static func isSpare(frameIndex index: Int, array: [Int]) -> Bool {
        return array[index] + array[index+1] == 10
    }
    
    //MARK:- Score calculation per frame
    static func strikeScore(from index: Int, in array: [Int]) -> Int {
        return 10 + array[index+1] + array[index+2]
    }
    
    static func spareScore(from index: Int, in array: [Int]) -> Int {
        return 10 + array[index+2]
    }
    
    static func regularScore(from index: Int, in array: [Int]) -> Int {
        return array[index] + array[index+1]
    }
}
