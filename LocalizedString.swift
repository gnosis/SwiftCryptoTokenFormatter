//
//  Copyright © 2018 Gnosis Ltd. All rights reserved.
//

import Foundation

func LocalizedString(_ key: String, comment: String) -> String {
    return NSLocalizedString(key, bundle: Bundle.SafeUIKit, comment: comment)
}
