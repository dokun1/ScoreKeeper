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
        .font(.title)
      MainTextField(placeholder: "", text: $name)
        .padding()
      Button(action: {
        viewModel.players.append(Player(name: name))
        showingSheet = false
      }, label: {
        Text("Add")
      })
      .padding()
      .border(Color.blue, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
      .background(Color.blue)
      .foregroundColor(.white)
      .cornerRadius(10)
    }
  }
}

public struct MainTextField: View {
  @State var placeholder: String
  @Binding var text: String
  
  public init(placeholder: String, text: Binding<String>) {
    self._placeholder = State(initialValue: placeholder)
    self._text = text
  }
  
  public var body: some View {
    HStack {
      Image(systemName: "person").foregroundColor(Color.blue)
      TextField(placeholder, text: $text)
        .font(.system(size: 20, weight: .regular, design: .default))
        .foregroundColor(Color.black)
    }.padding()
    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
  }
}

struct NewPlayerView_Previews: PreviewProvider {
  static var previews: some View {
    NewPlayerView(viewModel: ScoreListViewModel(), showingSheet: .constant(true))
  }
}
