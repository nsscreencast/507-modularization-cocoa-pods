Pod::Spec.new do |spec|
  spec.name = "Core"
  spec.summary = "Core models and stuff"
  spec.version = "0.1"
  spec.authors = { "team" => "team@company.com" }
  spec.license = "private"
  spec.source = { git: "https://example.com/core.git" }
  spec.homepage = "https://example.com/core"

  spec.ios.deployment_target = "14.0"
  spec.source_files = [
    "FeatureModule.swift",
    "Sources/**/*.swift"
  ]
  spec.dependency 'Util'
end

