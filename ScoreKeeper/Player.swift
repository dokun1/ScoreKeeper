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
  var score: Int
  
  init(name: String) {
    self.id = UUID()
    self.score = 0
    self.name = name
  }
}
