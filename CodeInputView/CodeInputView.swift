import UIKit

public class CodeInputView: UIView, UIKeyInput {
    public var delegate: CodeInputViewDelegate?
    private var nextTag = 1

    // MARK: - UIResponder

    public override func canBecomeFirstResponder() -> Bool {
        return true
    }

    // MARK: - UIView

    public override init(frame: CGRect) {
        super.init(frame: frame)

        // Add four digitLabels
        var frame = CGRect(x: 15, y: 10, width: 35, height: 40)
        for index in 1...4 {
            let digitLabel = UILabel(frame: frame)
            digitLabel.font = UIFont.systemFontOfSize(42)
            digitLabel.tag = index
            digitLabel.text = "–"
            digitLabel.textAlignment = .Center
            self.addSubview(digitLabel)
            frame.origin.x += 35 + 15
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIKeyInput

    public func hasText() -> Bool {
        return nextTag > 1 ? true : false
    }

    public func insertText(text: String) {
        if nextTag < 5 {
            (self.viewWithTag(nextTag) as! UILabel).text = text
            nextTag += 1

            if nextTag == 5 {
                var code = (self.viewWithTag(1) as! UILabel).text!
                for index in 2..<nextTag {
                    code += (self.viewWithTag(index) as! UILabel).text!
                }
                delegate?.codeInputView(self, didFinishWithCode: code)
            }
        }
    }

    public func deleteBackward() {
        if nextTag > 1 {
            nextTag -= 1
            (self.viewWithTag(nextTag) as! UILabel).text = "–"
        }
    }

    public func clear() {
        while nextTag > 1 {
            deleteBackward()
        }
    }

    // MARK: - UITextInputTraits

    public var keyboardType: UIKeyboardType { get { return .NumberPad } set { } }
}

public protocol CodeInputViewDelegate {
    func codeInputView(codeInputView: CodeInputView, didFinishWithCode code: String)
}
