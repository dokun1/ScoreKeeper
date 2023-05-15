//
//  MainTextField.swift
//  ScoreKeeper
//
//  Created by David Okun on 5/14/23.
//

import SwiftUI

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
