# slug-ffi
You probably don't need this.

slug-ffi is a playground crate that exposes a FFI of https://github.com/Stebalien/slug-rs.
It includes slugrs, a rubygem that bundles/wraps slug-ffi. 
This was mainly to play around with ruby/rust ffi integration.

## Install
Building slugrs builds slug-ffi crate as a dependency.

```bash
cd ruby/
gem build slugrs.gemspec 
gem install slugrs-0.1.0.gem
```

## Usage
```ruby
irb(main):004:0* require 'slugrs'
=> false
irb(main):005:0> Slugrs.slugify("Gaspésie–Îles-de-la-Madeleine")
=> "gaspesie-iles-de-la-madeleine"
```
