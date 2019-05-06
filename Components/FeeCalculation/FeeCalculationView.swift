//
//  Copyright © 2019 Gnosis Ltd. All rights reserved.
//

import Foundation
import UIKit

public class FeeCalculationView: UIView {

    public var calculation = FeeCalculation() {
        didSet {
            update()
        }
    }
    public var contentView: UIView!

    public override init(frame: CGRect) {
        super.init(frame: frame)
        update()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        update()
    }

    convenience init(_ calculation: FeeCalculation) {
        self.init(frame: .zero)
        self.calculation = calculation
    }

    public func update() {
        contentView?.removeFromSuperview()
        calculation.update()
        contentView = calculation.makeView()
        addSubview(contentView)
        wrapAroundDynamicHeightView(contentView, insets: .zero)
    }

}
