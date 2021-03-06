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
    assert_equal('things', Slugrs.slugify("\xC3things\xC3"))
  end

  def test_chockes_on_nul_byte
    assert_raises ArgumentError do
      Slugrs.slugify("thi\0ngs")
    end
  end
end
