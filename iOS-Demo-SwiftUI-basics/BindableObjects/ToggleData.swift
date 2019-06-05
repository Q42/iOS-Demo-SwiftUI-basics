//
//  ToggleData.swift
//  SwiftUI-Tutorial
//
//  Created by Jasper Haggenburg on 04/06/2019.
//  Copyright © 2019 Q42. All rights reserved.
//

import SwiftUI
import Combine

final class ToggleData: BindableObject {
  let didChange = PassthroughSubject<ToggleData, Never>()

  var items: [String: Bool] = [:] {
    didSet { self.didChange.send(self) }
  }

  func toggle(id: String) {
    if let item = items[id] {
      items[id] = !item
    } else {
      items[id] = true
    }
  }

  func isChecked(for id: String) -> Bool {
    if let item = items[id] {
      return item
    }
    return false
  }
}
