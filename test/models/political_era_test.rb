require "test_helper"

class PoliticalEraTest < ActiveSupport::TestCase
  test "can be saved without a dynasty" do
    political_era = PoliticalEra.new(
      name: "Era sem dinastia",
      country: countries(:one),
      government_type: government_types(:one)
    )

    assert political_era.save
    assert_nil political_era.reload.dynasty_id
  end
end
