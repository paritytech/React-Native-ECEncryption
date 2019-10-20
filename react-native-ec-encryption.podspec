require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-ec-encryption"
  s.version      = "1.1.0"
  s.summary      = "react-native-ec-encryption"
  s.description  = <<-DESC
                  A secure enclave backed encryption and decryption library
                   DESC
  s.homepage     = ""
  s.license      = "GPL-3.0"
  # s.license      = { :type => "GPL-3.0" }
  s.author             = { "hanwencheng" => "heawen.cheng@gmail.com" }
  s.homepage         = 'https://github.com/paritytech/React-Native-ECEncryption'
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/paritytech/React-Native-ECEncryption.git", :tag => "v1.1.0" }
  s.source_files  = "ios/**/*.{h,m,swift}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "..."

end

