//
//  NewPlayerView.swift
//  ScoreKeeper
//
//  Created by David Okun on 9/27/20.
//

import SwiftUI

struct NewPlayerView: View {
  @ObservedObject var viewModel: ScoreListViewModel
  @Binding var showingSheet: Bool
  @State private var name = ""
  
  var body: some View {
    NavigationStack {
      VStack {
        Text("New player name?")
          .font(.title)
        MainTextField(placeholder: "", text: $name)
          .padding()
      }.toolbar {
        ToolbarItem(placement: .primaryAction) {
          Button("Save") {
            viewModel.players.append(Player(name: name))
            showingSheet = false
          }
          .accessibilityIdentifier("savePlayerButton")
        }
        ToolbarItem(placement: .cancellationAction) {
          Button("Cancel") {
            showingSheet = false
          }
          .accessibilityIdentifier("cancelPlayerButton")
        }
      }
    }
  }
}

struct NewPlayerView_Previews: PreviewProvider {
  static var previews: some View {
    NewPlayerView(viewModel: ScoreListViewModel(), showingSheet: .constant(true))
  }
}
