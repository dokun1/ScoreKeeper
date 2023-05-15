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
  
  func deletePlayer(at offsets: IndexSet) {
    viewModel.players.remove(atOffsets: offsets)
  }
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(viewModel.players) { player in
          PlayerCell(player: player)
        }
        .onDelete(perform: deletePlayer)
      }
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          Button {
            isAddingPlayer.toggle()
          } label: {
            Image(systemName: "plus")
          }
          .accessibilityIdentifier("addPlayerButton")
        }
        ToolbarItem(placement: .cancellationAction) {
          Button {
            viewModel.resetScores()
          } label: {
            Text("Reset")
          }
          .accessibilityIdentifier("resetScoreButton")
        }
      }
      .navigationTitle("Game Scores")
    }
    .sheet(isPresented: $isAddingPlayer) {
      NewPlayerView(viewModel: viewModel, showingSheet: $isAddingPlayer)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ScoreList()
  }
}
