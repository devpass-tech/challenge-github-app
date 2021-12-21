// Copyright © 2021 DevPass. All rights reserved.

import Foundation

#if DEBUG
  import SwiftUI

  /// Generic structure that implement the boilerplate to make a UIView representable in SwiftUI
  /// This struct is meant to be used in SwiftUI previews, where we are interested in quickly checking
  /// what we are implementing. It shouldn't be used when you need a UIKit component work with the
  /// SwiftUI parts of the production app.
  ///
  /// To use it, copy and paste the following snippet in the UIKit View and replace the name of the preview
  /// and the commented code.
  ///
  /// ```swift
  /// #if DEBUG
  /// import SwiftUI
  ///
  /// struct <#YourView#>_Preview: PreviewProvider {
  ///     static var previews: some View {
  ///         return SwiftUIPreView { context in
  ///             // code to initialize and configure your view
  ///         }
  ///     }
  /// }
  /// #endif
  /// ```
  struct SwiftUIPreView<V>: UIViewRepresentable where V: UIView {
    let viewFactory: (Context) -> V

    func makeUIView(context: Context) -> V {
      return self.viewFactory(context)
    }

    func updateUIView(_: V, context _: Context) {}
  }
#endif
