require 'test_helper'

class SchoolDistrictsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_district = school_districts(:one)
  end

  test "should get index" do
    get school_districts_url, as: :json
    assert_response :success
  end

  test "should create school_district" do
    assert_difference('SchoolDistrict.count') do
      post school_districts_url, params: { school_district: { domain: @school_district.domain, name: @school_district.name } }, as: :json
    end

    assert_response 201
  end

  test "should show school_district" do
    get school_district_url(@school_district), as: :json
    assert_response :success
  end

  test "should update school_district" do
    patch school_district_url(@school_district), params: { school_district: { domain: @school_district.domain, name: @school_district.name } }, as: :json
    assert_response 200
  end

  test "should destroy school_district" do
    assert_difference('SchoolDistrict.count', -1) do
      delete school_district_url(@school_district), as: :json
    end

    assert_response 204
  end
end
