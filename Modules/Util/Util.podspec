Pod::Spec.new do |spec|
  spec.name = "Util"
  spec.summary = "Utilities"
  spec.version = "0.1"
  spec.authors = { "team" => "team@company.com" }
  spec.license = "private"
  spec.source = { git: "https://example.com/util.git" }
  spec.homepage = "https://example.com/util"

  spec.ios.deployment_target = "14.0"
  spec.source_files = [
    "FeatureModule.swift",
    "Sources/**/*.swift"
  ]
end

