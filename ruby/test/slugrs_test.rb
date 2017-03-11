require 'test_helper'

class SlugrsTest < Minitest::Test
  def test_it_slugifies
    assert_equal(
      'gaspesie-iles-de-la-madeleine',
      Slugrs.slugify("Gaspésie–Îles-de-la-Madeleine")
    )
  end

  def test_returns_nil_on_nil
    assert_nil(Slugrs.slugify(nil))
  end

  def test_lossy_invalid_utf8
    assert_equal('things', Slugrs.slugify("\xC3things\xC3".force_encoding('utf-8')))
  end
end
