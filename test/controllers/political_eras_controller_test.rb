require "test_helper"

class PoliticalErasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @political_era = political_eras(:one)
  end

  test "should get index" do
    get political_eras_url, as: :json
    assert_response :success
  end

  test "should create political_era" do
    assert_difference("PoliticalEra.count") do
      post political_eras_url, params: { political_era: { country_id: @political_era.country_id, dynasty_id: @political_era.dynasty_id, end_date: @political_era.end_date, enddate_approximate: @political_era.enddate_approximate, full_name: @political_era.full_name, full_name_local: @political_era.full_name_local, government_type_id: @political_era.government_type_id, name: @political_era.name, start_date: @political_era.start_date, startdate_approximate: @political_era.startdate_approximate } }, as: :json
    end

    assert_response :created
  end

  test "should show political_era" do
    get political_era_url(@political_era), as: :json
    assert_response :success
  end

  test "should show political eras by year and country tag" do
    country = countries(:one)
    country.update!(tag: "TEST")

    get "/countries/TEST/political_eras/show_by_year", params: { selected_date: "2026-09-14" }, as: :json

    assert_response :success
    assert_equal [@political_era.id], response.parsed_body.map { |political_era| political_era["id"] }
  end

  test "should include political eras and flags without an end date" do
    country = countries(:one)
    country.update!(tag: "TEST")
    political_era = PoliticalEra.create!(
      country:,
      dynasty: dynasties(:one),
      government_type: government_types(:one),
      start_date: "2026-09-14"
    )
    flag = Flag.create!(political_era:, start_date: "2026-09-21")
    capital = Capital.create!(political_era:, name: "Test Capital", start_date: "2026-09-21")
    params = { selected_date: "2026-10-01" }

    get "/countries/TEST/political_eras/show_by_year", params:, as: :json

    assert_response :success
    assert_equal [political_era.id], response.parsed_body.map { |era| era["id"] }
    assert_equal flag.id, response.parsed_body.first.dig("flag", "id")
    assert_equal [capital.id], response.parsed_body.first.fetch("capitals").map { |item| item["id"] }

    get "/countries/#{country.id}/political_eras/show_by_year", params:, as: :json

    assert_response :success
    assert_equal [political_era.id], response.parsed_body.map { |era| era["id"] }
    assert_equal flag.id, response.parsed_body.first.dig("flag", "id")
    assert_equal [capital.id], response.parsed_body.first.fetch("capitals").map { |item| item["id"] }
  end

  test "should update political_era" do
    patch political_era_url(@political_era), params: { political_era: { country_id: @political_era.country_id, dynasty_id: @political_era.dynasty_id, end_date: @political_era.end_date, enddate_approximate: @political_era.enddate_approximate, full_name: @political_era.full_name, full_name_local: @political_era.full_name_local, government_type_id: @political_era.government_type_id, name: @political_era.name, start_date: @political_era.start_date, startdate_approximate: @political_era.startdate_approximate } }, as: :json
    assert_response :success
  end

  test "should destroy political_era" do
    assert_difference("PoliticalEra.count", -1) do
      delete political_era_url(@political_era), as: :json
    end

    assert_response :no_content
  end
end
