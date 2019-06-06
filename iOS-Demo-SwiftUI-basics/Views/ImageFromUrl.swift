//
//  ImageFromUrlView.swift
//  SwiftUI-Tutorial
//
//  Created by Jasper Haggenburg on 04/06/2019.
//  Copyright © 2019 Q42. All rights reserved.
//

import SwiftUI

struct ImageFromUrl: View {
  @EnvironmentObject var imageStorage: ImageStorage

  let imageUrl: URL
  let width: CGFloat = 50
  let height: CGFloat = 50

  init(imageUrl: URL) {
    self.imageUrl = imageUrl
  }

  var body: some View {
    let image = imageStorage.imageForUrl(imageUrl)

    return image.map {
      ViewBuilder.buildEither(first:
        Image(uiImage: $0)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .clipShape(Circle())
          .frame(width: 50, height: 50)
      )
    } ??
      ViewBuilder.buildEither(second:
        Circle()
          .fill(Color.gray)
          .frame(width: width, height: height)
    )
  }
}
