require 'slugrs/version'
require 'ffi'

module Slugrs
  extend FFI::Library
  ffi_lib File.join(
    File.dirname(__FILE__),
    "../ext/target/release/libslug_ffi.#{FFI::Platform::LIBSUFFIX}"
  )
  attach_function :slugify, [:string], :string
end
