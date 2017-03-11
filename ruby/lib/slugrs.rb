require 'slugrs/version'
require 'ffi'

module Slugrs
  module Binding
    extend FFI::Library

    LIB_PATH = File.join(
      File.dirname(__FILE__),
      '../ext/target/release',
      "libslug_ffi.#{FFI::Platform::LIBSUFFIX}"
    )

    ffi_lib(LIB_PATH)
    attach_function(:generate, :slug_generate, [:string], :strptr)
    attach_function(:free, :slug_free, [:pointer], :void)
  end

  def self.slugify(str)
    slug, ptr = Binding.generate(str)
    FFI::AutoPointer.new(ptr, Binding.method(:free))

    slug
  end
end
