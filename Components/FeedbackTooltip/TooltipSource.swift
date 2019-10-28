//
//  Copyright © 2019 Gnosis Ltd. All rights reserved.
//

import UIKit

public class TooltipSource: FeedbackTooltipDelegate {

    private weak var tooltip: FeedbackTooltip?
    private weak var target: UIView?

    private var onTap: (() -> Void)?
    private var onAppear: (() -> Void)?
    private var onDisappear: (() -> Void)?

    public var isActive: Bool = true
    public var message: String?

    public init(target: UIView,
                onTap: (() -> Void)? = nil,
                onAppear: (() -> Void)? = nil,
                onDisappear: (() -> Void)? = nil) {
        self.target = target
        self.onTap = onTap
        self.onAppear = onAppear
        self.onDisappear = onDisappear
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        tapRecognizer.cancelsTouchesInView = false
        target.addGestureRecognizer(tapRecognizer)
        target.isUserInteractionEnabled = true
    }

    @objc private func didTap() {
        if let tooltip = self.tooltip, tooltip.isVisible {
            tooltip.hide(completion: nil)
            return
        }
        guard isActive,
            let message = self.message, !message.isEmpty,
            let window = UIApplication.shared.keyWindow,
            let target = target else { return }
        tooltip = FeedbackTooltip.show(for: target, in: window, message: message, delegate: self)
        onTap?()
    }

    public func tooltipWillAppear(_ tooltip: FeedbackTooltip) {
        onAppear?()
    }

    public func tooltipWillDisappear(_ tooltip: FeedbackTooltip) {
        onDisappear?()
    }

}
