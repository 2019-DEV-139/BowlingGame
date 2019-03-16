//
//  BowlingGameTests.swift
//  BowlingGameTests
//
//  Created by 2019_DEV_139 on 16/03/2019.
//  Copyright © 2019 2019_DEV_139. All rights reserved.
//

import XCTest
@testable import BowlingGame

class BowlingGameTests: XCTestCase {
    func test_gameStringConversion() {
        // Given
        let stringGame = "X 6/ 5- X"
        
        // When
        let game = SimpleCalculator.convertGameStringToValues(stringGame)
        
        // Then
        XCTAssertEqual(game, [10, 6, 4, 5, 0, 10])
    }
    
    func test_isStrike_true() {
        // Given
        let game = [10]
        
        // When
        let isStrike = SimpleCalculator.isStrike(frameIndex: 0, array: game)
        
        // Then
        XCTAssertTrue(isStrike)
    }
    
    func test_isStrike_false() {
        // Given
        let game = [6, 4, 10]
        
        // When
        let isStrike = SimpleCalculator.isStrike(frameIndex: 0, array: game)
        
        // Then
        XCTAssertFalse(isStrike)
    }
    
    func test_isSpare_true() {
        // Given
        let game = [3, 7]
        
        // When
        let isSpare = SimpleCalculator.isSpare(frameIndex: 0, array: game)
        
        // Then
        XCTAssertTrue(isSpare)
    }
    
    func test_isSpare_complex_true() {
        // Given
        let game = [10, 5, 0, 8, 2, 10]
        
        // When
        let isSpare = SimpleCalculator.isSpare(frameIndex: 3, array: game)
        
        // Then
        XCTAssertTrue(isSpare)
    }
    
    func test_isSpare_false() {
        // Given
        let game = [0, 7]
        
        // When
        let isSpare = SimpleCalculator.isSpare(frameIndex: 0, array: game)
        
        // Then
        XCTAssertFalse(isSpare)
    }
    
    func test_scoreFromStrike() {
        // Given
        let game = [10, 10, 8, 2, 6, 0]
        
        // When
        let frameScore = SimpleCalculator.strikeScore(from: 0, in: game)
        
        // Then
        XCTAssertEqual(frameScore, 28)
    }
    
    func test_scoreFromSpare() {
        // Given
        let game = [10, 10, 8, 2, 6, 0]
        
        // When
        let frameScore = SimpleCalculator.spareScore(from: 2, in: game)
        
        // Then
        XCTAssertEqual(frameScore, 16)
    }
    
    func test_scoreFromRegularFrame() {
        // Given
        let game = [10, 10, 8, 2, 6, 0]
        
        // When
        let frameScore = SimpleCalculator.regularScore(from: 3, in: game)
        
        // Then
        XCTAssertEqual(frameScore, 8)
    }
    
    func test_gameScore_allNines() {
        // Given
        let game = GameStrings.nines
        
        // When
        let score = try? SimpleCalculator.calculateScore(from: game)
        
        // Then
        XCTAssertEqual(score, 90)
    }
    
    func test_gameScore_allSaves() {
        // Given
        let game = GameStrings.saves
        
        // When
        let score = try? SimpleCalculator.calculateScore(from: game)
        
        // Then
        XCTAssertEqual(score, 150)
    }
    
    func test_gameScore_allStrikes() {
        // Given
        let game = GameStrings.perfect
        
        // When
        let score = try? SimpleCalculator.calculateScore(from: game)
        
        // Then
        XCTAssertEqual(score, 300)
    }
}
