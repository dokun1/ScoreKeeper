//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by David Okun on 9/27/20.
//

import SwiftUI

struct ScoreList: View {
  @ObservedObject var viewModel = ScoreListViewModel()
  @State private var isAddingPlayer = false
  
  var body: some View {
    NavigationView {
      List(viewModel.players, id: \Player.id) { player in
        PlayerCell(player: player)
      }.navigationBarItems(trailing:
                            Button(action: {
                              isAddingPlayer = true
                            }, label: {
                              Image(systemName: "plus")
                            })
      ).navigationBarTitle("Game Scores")
    }.sheet(isPresented: $isAddingPlayer) {
      NewPlayerView(viewModel: viewModel, showingSheet: $isAddingPlayer)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ScoreList()
  }
}


