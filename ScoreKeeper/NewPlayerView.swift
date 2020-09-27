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
    VStack {
      Text("New player name?")
        .font(.headline)
      TextField("", text: $name)
        .border(Color.gray, width: 1)
      Button(action: {
        viewModel.players.append(Player(name: name))
        showingSheet = false
      }, label: {
        Text("Add")
      })
    }
  }
}

//struct NewPlayerView_Previews: PreviewProvider {
//  static var previews: some View {
//    NewPlayerView(viewModel: ScoreListViewModel(), showingSheet: Binding(Boo))
//  }
//}
