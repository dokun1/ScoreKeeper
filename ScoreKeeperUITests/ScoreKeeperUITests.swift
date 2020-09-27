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
    app.navigationBars["Game Scores"].buttons["plus"].tap()
    app.textFields.element.tap()
    app.textFields.element.typeText("Test Player")
    app.buttons["Add"].tap()

    XCTAssert(app.tables.staticTexts["Test Player"].exists, "Should be able to find a new player named Test Player")
  }
  
  func testPlayerScoreModification() throws {
    let app = XCUIApplication()
    app.launch()
    app.navigationBars["Game Scores"].buttons["plus"].tap()
    app.textFields.element.tap()
    app.textFields.element.typeText("Test Player")
    app.buttons["Add"].tap()
    app.tables.cells["0, Test Player"].otherElements.containing(.staticText, identifier:"0").children(matching: .other).element.tap()
    app.tables.cells["1, Test Player"].otherElements.containing(.staticText, identifier:"1").children(matching: .other).element.tap()
    app.tables.cells["2, Test Player"].otherElements.containing(.staticText, identifier:"2").children(matching: .other).element.tap()
    XCTAssert(app.tables.staticTexts["3"].exists, "Should have been able to modify the test player's score by 3")
  }
}
