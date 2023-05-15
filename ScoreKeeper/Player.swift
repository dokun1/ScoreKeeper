//
//  Player.swift
//  ScoreKeeper
//
//  Created by David Okun on 9/27/20.
//

import Foundation

class Player: ObservableObject, Identifiable {
  var id: UUID
  var name: String
  @Published var score: Int
  
  init(id: UUID = UUID(), name: String) {
    self.id = id
    self.score = 0
    self.name = name
  }
  
  func updateScore(to score: Int) {
    self.score = score
  }
  
  func resetScore() {
    self.score = 0
  }
}
