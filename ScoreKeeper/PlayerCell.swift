//
//  PlayerCell.swift
//  ScoreKeeper
//
//  Created by David Okun on 9/27/20.
//

import Foundation
import SwiftUI

struct PlayerCell: View {
  @ObservedObject var player: Player
  
  var body: some View {
    HStack {
      Text(player.name)
      Stepper(
        onIncrement: {
          print("incrementing")
          print("score before: \(player.score)")
          player.score = player.score + 1
          print("score after: \(player.score)")
        },
        onDecrement: {
          print("decrementing")
          print("score before: \(player.score)")
          player.score = player.score - 1
          print("score after: \(player.score)")
        },
        label: {
          Text("Score: ")
        })
      Text("\(player.score)")
    }
  }
}

//struct PlayerCell_Previews: PreviewProvider {
//  static var previews: some View {
//    PlayerCell(player: Player(name: "Candace"))
//  }
//}
