require "test_helper"

class TracksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tracks_index_url
    assert_response :success
  end
  test "should create new record" do
    assert_difference('Track.count') do
      post :create, params: { model: { name: "Test Model", file: fixture_file_upload('sample.gpx') } }
    end
    assert_redirected_to model_path(assigns(:model))
  end

  test "should not create new record with invalid parameters" do
    assert_no_difference('Track.count') do
      post :create, params: { model: { name: "", file: fixture_file_upload('sample.txt', 'text/plain') } }
    end
    assert_template :new
  end
end
