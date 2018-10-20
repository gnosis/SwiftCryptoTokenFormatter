//
//  Copyright © 2018 Gnosis Ltd. All rights reserved.
//

import XCTest
@testable import SafeUIKit

class CheckmarkButtonTests: XCTestCase {

    let button = CheckmarkButton()

    func test_whenCheckEnabled_showsUncheckedImage() {
        button.checkmarkStatus = .normal
        XCTAssertEqual(button.image(for: .normal), Asset.checkmarkNormal.image)
    }

    func test_whenChecked_thenShowsSelectedImage() {
        button.checkmarkStatus = .selected
        XCTAssertEqual(button.image(for: .normal), Asset.checkmarkSelected.image)
    }

    func test_whenEnabledDisabledCheckmark_thenHasNoImage() {
        button.checkmarkStatus = .normal
        button.checkmarkStatus = .disabled
        XCTAssertNil(button.image(for: .normal))
    }

}
