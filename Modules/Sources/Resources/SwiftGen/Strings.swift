// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  /// Cancel
  public static let btCancel = L10n.tr("Localizable", "bt_cancel", fallback: "Cancel")
  /// Done
  public static let btDone = L10n.tr("Localizable", "bt_done", fallback: "Done")
  /// NEXT
  public static let btNext = L10n.tr("Localizable", "bt_next", fallback: "NEXT")
  /// No
  public static let btNo = L10n.tr("Localizable", "bt_no", fallback: "No")
  /// OK
  public static let btOk = L10n.tr("Localizable", "bt_ok", fallback: "OK")
  /// Yes
  public static let btYes = L10n.tr("Localizable", "bt_yes", fallback: "Yes")
  /// No internet
  public static let errorNetworkShortTitle = L10n.tr("Localizable", "error_network_short_title", fallback: "No internet")
  /// Your connection may have timed out. Please refresh the page or try again.
  public static let errorNetworkTitle = L10n.tr("Localizable", "error_network_title", fallback: "Your connection may have timed out. Please refresh the page or try again.")
  /// Something went wrong :(
  public static let errorTitle = L10n.tr("Localizable", "error_title", fallback: "Something went wrong :(")
  /// Unknown
  public static let unknown = L10n.tr("Localizable", "unknown", fallback: "Unknown")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = Bundle.swiftUIPreviewsCompatibleModule.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}
