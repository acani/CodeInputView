# CodeInputView

6-Digit Code Input Text Field

![Screenshots][1]

Setup: [How to add a Git repository to your Xcode project][2]

Usage:

```swift
import UIKit

class EnterCodeViewController: UIViewController, CodeInputViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: (view.frame.width-315)/2, y: 242, width: 315, height: 60)
        let codeInputView = CodeInputView(frame: frame)
        codeInputView.delegate = self
        view.addSubview(codeInputView)
        codeInputView.becomeFirstResponder()
    }

    func codeInputView(codeInputView: CodeInputView, didFinishWithCode code: String) {
        let title = (code == "123456" ? "Correct!" : "Wrong!")
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel) { _ in codeInputView.clear() })
        present(alert, animated: true)
    }
}
```

Released under the [Unlicense][3].


  [1]: Screenshots.gif
  [2]: https://github.com/acani/Libraries
  [3]: http://unlicense.org
