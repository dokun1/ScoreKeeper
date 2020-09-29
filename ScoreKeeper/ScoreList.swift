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
    NavigationView {
      List {
        ForEach(viewModel.players) { player in
          PlayerCell(player: player)
        }
        .onDelete(perform: deletePlayer)
      }
      .navigationBarItems(leading: Button(action: {
        _ = viewModel.players.map { $0.resetScore() }
      }, label: {
        Image(systemName: "trash.circle")
      }), trailing:
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
