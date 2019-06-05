//
//  ContentView.swift
//  SwiftUI-Tutorial
//
//  Created by Jasper Haggenburg on 04/06/2019.
//  Copyright © 2019 Q42. All rights reserved.
//

import SwiftUI
import Combine

struct Content: View {
  var body: some View {
    List {
      ForEach((0..<25)) { i in
        Row(
          id: "\(i)",
          imageUrl: URL(string: "https://picsum.photos/50/50?i=\(i)")!,
          title: "Row \(i)",
          isChecked: false
        )
      }
    }
  }
}
