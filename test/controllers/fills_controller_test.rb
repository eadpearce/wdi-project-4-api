require 'test_helper'

class FillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fill = fills(:one)
  end

  test "should get index" do
    get fills_url, as: :json
    assert_response :success
  end

  test "should create fill" do
    assert_difference('Fill.count') do
      post fills_url, params: { fill: { body: @fill.body, prompt_id: @fill.prompt_id, user_id: @fill.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show fill" do
    get fill_url(@fill), as: :json
    assert_response :success
  end

  test "should update fill" do
    patch fill_url(@fill), params: { fill: { body: @fill.body, prompt_id: @fill.prompt_id, user_id: @fill.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy fill" do
    assert_difference('Fill.count', -1) do
      delete fill_url(@fill), as: :json
    end

    assert_response 204
  end
end
