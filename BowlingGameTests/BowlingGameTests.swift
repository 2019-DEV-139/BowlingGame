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
}
