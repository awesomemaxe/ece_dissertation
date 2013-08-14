require 'test_helper'

class DissTrackersControllerTest < ActionController::TestCase
  setup do
    @diss_tracker = diss_trackers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diss_trackers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diss_tracker" do
    assert_difference('DissTracker.count') do
      post :create, diss_tracker: { UID: @diss_tracker.UID, advisor: @diss_tracker.advisor, chair: @diss_tracker.chair, data_approved: @diss_tracker.data_approved, first_name: @diss_tracker.first_name, last_name: @diss_tracker.last_name, reader2: @diss_tracker.reader2, reader3: @diss_tracker.reader3, reader4: @diss_tracker.reader4, reader5: @diss_tracker.reader5, titile: @diss_tracker.titile }
    end

    assert_redirected_to diss_tracker_path(assigns(:diss_tracker))
  end

  test "should show diss_tracker" do
    get :show, id: @diss_tracker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @diss_tracker
    assert_response :success
  end

  test "should update diss_tracker" do
    patch :update, id: @diss_tracker, diss_tracker: { UID: @diss_tracker.UID, advisor: @diss_tracker.advisor, chair: @diss_tracker.chair, data_approved: @diss_tracker.data_approved, first_name: @diss_tracker.first_name, last_name: @diss_tracker.last_name, reader2: @diss_tracker.reader2, reader3: @diss_tracker.reader3, reader4: @diss_tracker.reader4, reader5: @diss_tracker.reader5, titile: @diss_tracker.titile }
    assert_redirected_to diss_tracker_path(assigns(:diss_tracker))
  end

  test "should destroy diss_tracker" do
    assert_difference('DissTracker.count', -1) do
      delete :destroy, id: @diss_tracker
    end

    assert_redirected_to diss_trackers_path
  end
end
