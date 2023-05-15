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
  var int = 0
  
  var body: some View {
    HStack {
      Text(player.name)
        .font(.title)
      Stepper(value: $player.score) {
        Text("")
      }
      Text("\(player.score)")
        .padding()
        .font(.title)
        .background(Color.blue)
        .cornerRadius(10.0)
        .foregroundColor(.white)
    }.padding()
  }
}

struct PlayerCell_Previews: PreviewProvider {
  static var previews: some View {
    PlayerCell(player: Player(name: "David"))
  }
}
