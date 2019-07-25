// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable operator_usage_whitespace
extension Color {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
// swiftlint:enable operator_usage_whitespace

// swiftlint:disable identifier_name line_length type_body_length
struct ColorName {
  let rgbaValue: UInt32
  var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d4d4d3"></span>
  /// Alpha: 59% <br/> (0xd4d4d397)
  static let cardShadow = ColorName(rgbaValue: 0xd4d4d397)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#607e79"></span>
  /// Alpha: 36% <br/> (0x607e795c)
  static let cardShadowPassword = ColorName(rgbaValue: 0x607e795c)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#28363d"></span>
  /// Alpha: 18% <br/> (0x28363d2e)
  static let cardShadowTooltip = ColorName(rgbaValue: 0x28363d2e)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#001428"></span>
  /// Alpha: 100% <br/> (0x001428ff)
  static let darkBlue = ColorName(rgbaValue: 0x001428ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#5d6d74"></span>
  /// Alpha: 100% <br/> (0x5d6d74ff)
  static let darkGrey = ColorName(rgbaValue: 0x5d6d74ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#008c73"></span>
  /// Alpha: 100% <br/> (0x008c73ff)
  static let hold = ColorName(rgbaValue: 0x008c73ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#005546"></span>
  /// Alpha: 100% <br/> (0x005546ff)
  static let holdTwo = ColorName(rgbaValue: 0x005546ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d4d5d3"></span>
  /// Alpha: 100% <br/> (0xd4d5d3ff)
  static let lightGrey = ColorName(rgbaValue: 0xd4d5d3ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#b2b5b2"></span>
  /// Alpha: 100% <br/> (0xb2b5b2ff)
  static let mediumGrey = ColorName(rgbaValue: 0xb2b5b2ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ff3b30"></span>
  /// Alpha: 100% <br/> (0xff3b30ff)
  static let tomato = ColorName(rgbaValue: 0xff3b30ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f7f5f5"></span>
  /// Alpha: 100% <br/> (0xf7f5f5ff)
  static let white = ColorName(rgbaValue: 0xf7f5f5ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#e9e7e6"></span>
  /// Alpha: 100% <br/> (0xe9e7e6ff)
  static let whitesmoke = ColorName(rgbaValue: 0xe9e7e6ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f0efee"></span>
  /// Alpha: 100% <br/> (0xf0efeeff)
  static let whitesmokeTwo = ColorName(rgbaValue: 0xf0efeeff)
}
// swiftlint:enable identifier_name line_length type_body_length

extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
