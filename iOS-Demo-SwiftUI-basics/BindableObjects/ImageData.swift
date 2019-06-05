//
//  ImageData.swift
//  SwiftUI-Tutorial
//
//  Created by Jasper Haggenburg on 04/06/2019.
//  Copyright © 2019 Q42. All rights reserved.
//

import SwiftUI
import Combine

struct ImageStorageItem {
  var image: UIImage?
}

final class ImageStorage: BindableObject {
  let didChange = PassthroughSubject<ImageStorage, Never>()

  var items: [URL: ImageStorageItem] = [:] {
    didSet { didChange.send(self) }
  }

  func imageForUrl(_ url: URL) -> UIImage? {
    if items[url] == nil {
      // Initialize state...
      items[url] = ImageStorageItem()

      // Start loading...
      getData(from: url) { data, response, error in
        guard let data = data, error == nil else { return }

        // Loaded
        DispatchQueue.main.async {
          self.items[url]?.image = UIImage(data: data)
        }
      }
    }

    return items[url]?.image
  }

  func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
  }
}
