//
//  ScoreKeeperUITests.swift
//  ScoreKeeperUITests
//
//  Created by David Okun on 9/27/20.
//

import XCTest

class ScoreKeeperUITests: XCTestCase {

  override func setUpWithError() throws {
    continueAfterFailure = false
  }
  
  func testPlayerCreation() throws {
    let app = XCUIApplication()
    app.launch()
    app.buttons["addPlayerButton"].tap()
    app.textFields.element.tap()
    app.textFields.element.typeText("Test Player")
    app.buttons["savePlayerButton"].tap()

    XCTAssertTrue(app.staticTexts["Test Player"].exists, "Should be able to find a new player named Test Player")
  }
  
  func testPlayerScoreModification() throws {
    let app = XCUIApplication()
    app.launch()
    app.buttons["addPlayerButton"].tap()
    app.textFields.element.tap()
    app.textFields.element.typeText("Test Player")
    app.buttons["savePlayerButton"].tap()
    app.steppers.firstMatch.buttons["Increment"].firstMatch.tap()
    app.steppers.firstMatch.buttons["Increment"].firstMatch.tap()
    app.steppers.firstMatch.buttons["Increment"].firstMatch.tap()
    XCTAssertTrue(app.staticTexts["3"].exists, "Should have been able to modify the test player's score by 3")
  }
}
