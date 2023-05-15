//
//  ScoreListViewModel.swift
//  ScoreKeeper
//
//  Created by David Okun on 9/27/20.
//

import Foundation
import SwiftUI
import Combine

final class ScoreListViewModel: ObservableObject {
  @Published var players = [Player]()
  
  func resetScores() {
    for player in players {
      player.resetScore()
    }
  }
}
