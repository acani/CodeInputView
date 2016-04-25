# CodeInputView

4-Digit Code Input Text Field

![Screenshots][1]

Setup: [How to add a Git repository to your Xcode project][2]

Usage:

```swift
import UIKit

class EnterCodeViewController: UIViewController, CodeInputViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()

        let codeInputView = CodeInputView(frame: CGRect(x: (view.frame.width-215)/2, y: 242, width: 215, height: 60))
        codeInputView.delegate = self
        codeInputView.tag = 17
        view.addSubview(codeInputView)

        codeInputView.becomeFirstResponder()
    }

    func codeInputView(codeInputView: CodeInputView, didFinishWithCode code: String) {
        let title = code == "1234" ? "Correct!" : "Wrong!"
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel) { _ in
            (self.view.viewWithTag(17) as! CodeInputView).clear()
        })
        presentViewController(alert, animated: true, completion: nil)
    }
}
```

Released under the [Unlicense][3].


  [1]: Screenshots.gif
  [2]: https://github.com/acani/Libraries
  [3]: http://unlicense.org
