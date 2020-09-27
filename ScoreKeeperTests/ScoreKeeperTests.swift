//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by David Okun on 9/27/20.
//

import XCTest
@testable import ScoreKeeper

class ScoreKeeperTests: XCTestCase {
  func testNewPlayerCreation() throws {
    let newPlayer = Player(name: "Test Player")
    XCTAssertNotNil(newPlayer, "New player object should be created only with name")
    XCTAssertEqual(newPlayer.score, 0, "New player should always have a score of zero")
  }
  
  func testPlayerIdentifiersAreUnique() throws {
    let newPlayer1 = Player(name: "Test Player")
    let newPlayer2 = Player(name: "Test Player")
    XCTAssertNotEqual(newPlayer1.id, newPlayer2.id, "All new player IDs should be unique")
  }
  
  func testPlayerScoreUpdatedProperly() throws {
    let newPlayer = Player(name: "Test Player")
    XCTAssertEqual(newPlayer.score, 0, "New player should always have a score of zero")
    newPlayer.updateScore(to: 4)
    XCTAssertEqual(newPlayer.score, 4, "New player should have properly updated score")
  }
  
  func testPlayerScoreReset() throws {
    let newPlayer = Player(name: "Test Player")
    XCTAssertEqual(newPlayer.score, 0, "New player should always have a score of zero")
    newPlayer.updateScore(to: 4)
    XCTAssertEqual(newPlayer.score, 4, "New player should have properly updated score")
    newPlayer.resetScore()
    XCTAssertEqual(newPlayer.score, 0, "New player should always have a score of zero after resetScore is called")
  }  
}
