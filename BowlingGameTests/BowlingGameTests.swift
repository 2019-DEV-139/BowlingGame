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

    func test_allNines() {
        // Given
        let game = GameStrings.nines
        
        // When
        let score = try? SimpleCalculator.calculateScore(from: game)
        
        // Then
        XCTAssertEqual(score, 90)
    }

}
