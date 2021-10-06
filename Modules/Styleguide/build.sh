#! /bin/bash
set -e

xcodebuild -scheme Styleguide -destination 'platform=iOS Simulator,OS=14.5,name=iPhone 11 Pro'
