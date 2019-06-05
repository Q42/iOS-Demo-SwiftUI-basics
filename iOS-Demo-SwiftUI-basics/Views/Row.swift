//
//  RowView.swift
//  SwiftUI-Tutorial
//
//  Created by Jasper Haggenburg on 04/06/2019.
//  Copyright © 2019 Q42. All rights reserved.
//

import SwiftUI
import Combine

typealias RowID = String

struct Row: View {
  @EnvironmentObject var toggleData: ToggleData

  let id: RowID
  let imageUrl: URL
  let title: String
  @State var isChecked: Bool { toggleData.isChecked(for: id) }

  var body: some View {
    HStack {
      ImageFromUrl(imageUrl: imageUrl)
      Text(title)
      Toggle(isOn: $isChecked) { EmptyView() }
    }
  }
}

