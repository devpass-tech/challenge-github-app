// Copyright © 2021 Bending Spoons S.p.A. All rights reserved.

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

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View
    
    init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    func makeUIView(context: Context) -> View {
        return view
    }
    
    func updateUIView(_ uiView: View, context: Context) {
        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

@available(iOS 13.0, *)
extension UIViewController {
    
    private struct Preview: UIViewControllerRepresentable {
        
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }
    
    public var preview: some View {
        return Preview(viewController: self)
    }
}
#endif
