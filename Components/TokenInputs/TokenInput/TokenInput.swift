//
//  Copyright © 2018 Gnosis Ltd. All rights reserved.
//

import UIKit
import BigInt

public final class TokenInput: VerifiableInput {

    public private(set) var decimals: Int = 18
    public private(set) var value: BigInt = 0
    public private(set) var formatter = TokenNumberFormatter()

    private let decimalSeparator: String = (Locale.current as NSLocale).decimalSeparator

    enum Strings {
        static let amount = LocalizedString("token_input.amount", comment: "Amount placeholder for token input.")
        enum Rules {
            static let valueIsTooBig = LocalizedString("token_input.value_is_too_big",
                                                       comment: "Error display if entered value is too big.")
            static let excededAmountOfFractionalDigits =
                LocalizedString("token_input.exceded_amount_of_fractional_digits",
                                comment: "Error display if amount of fractional digits is exceded.")
            static let excededAmountOfIntegerDigits =
                LocalizedString("token_input.exceded_amount_of_integer_digits",
                                comment: "Error display if amount of integer digits is exceded.")
        }
    }

    public var imageURL: URL? {
        didSet {
            textInput.leftImageURL = imageURL
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    private func commonInit() {
        textInput.placeholder = Strings.amount
        textInput.leftImage = Asset.TokenIcons.defaultToken.image
        textInput.keyboardType = .decimalPad
        textInput.delegate = self
        maxLength = TokenBounds.maxDigitsCount
        addDefaultValidationsRules()
    }

    private func addDefaultValidationsRules() {
        addRule(Strings.Rules.valueIsTooBig, identifier: "valueIsTooBig") { self.valueIsTooBig($0) }
    }

    private func valueIsTooBig(_ value: String) -> Bool {
        guard let number = formatter.number(from: value) else { return false }
        return TokenBounds.isWithinBounds(value: number)
    }

    /// Configut TokenInput with initial value and decimals. Default values are value = 0, decimals = 18.
    ///
    /// - Parameters:
    ///   - value: Initital BigInt value
    ///   - decimals: Decimals of a ERC20 Token. https://theethereum.wiki/w/index.php/ERC20_Token_Standard
    public func setUp(value: BigInt, decimals: Int) {
        precondition(TokenBounds.hasCorrectDigitCount(decimals))
        precondition(TokenBounds.isWithinBounds(value: value))
        self.decimals = decimals
        self.value = value
        formatter = TokenNumberFormatter.ERC20Token(decimals: decimals)
        guard value != 0 else {
            textInput.text = nil
            return
        }
        textInput.text = formatter.string(from: value)
    }

}

// MARK: - UITextFieldDelegate

public extension TokenInput {

    override func textField(_ textField: UITextField,
                            shouldChangeCharactersIn range: NSRange,
                            replacementString string: String) -> Bool {
        guard super.textField(textField, shouldChangeCharactersIn: range, replacementString: string) else {
            return false
        }
        let updatedText = (textField.nonNilText as NSString).replacingCharacters(in: range, with: string)
        let components = updatedText.components(separatedBy: decimalSeparator)
        guard components.count < 3 else { return false }
        guard components.reduce(true, { $0 && !$1.hasNonDecimalDigitCharacters }) else { return false }
        return true
    }

}
