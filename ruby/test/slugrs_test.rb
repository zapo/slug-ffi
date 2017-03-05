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
end
