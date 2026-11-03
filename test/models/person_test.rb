require "test_helper"

class PersonTest < ActiveSupport::TestCase
  test "can be saved without a dynasty" do
    person = Person.new(name: "Pessoa sem dinastia")

    assert person.save
    assert_nil person.reload.dynasty_id
  end
end
