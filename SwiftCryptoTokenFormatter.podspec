Pod::Spec.new do |spec|
    spec.name         = "SwiftCryptoTokenFormatter"
    spec.version      = "1.0.0"
    spec.summary      = "Formatter for crypto token amounts."
    spec.description  = <<-DESC
    Crypto tokens can have arbitrary precision. This formatter specifies standard rules for displaying token amounts in the user interface.
                     DESC
    spec.homepage     = "https://github.com/gnosis/SwiftCryptoTokenFormatter"
    spec.license      = { :type => "MIT", :file => "LICENSE" }
    spec.author             = { "Dmitry Bespalov" => "dmitry.bespalov@gnosis.io", "Andrey Scherbovich" => "andrey@gnosis.io" }
    spec.cocoapods_version = '>= 1.4.0'
    spec.platform     = :ios, "11.0"
    spec.swift_version = "5.0"
    spec.source       = { :git => "https://github.com/gnosis/SwiftCryptoTokenFormatter.git", :tag => "#{spec.version}" }
    spec.source_files  = "Sources/**/*.swift"
    spec.requires_arc = true
    spec.dependency "BigInt", "~> 5.1.0"
  end
  