require 'test_helper'

class PersonilDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personil_detail = personil_details(:one)
  end

  test "should get index" do
    get personil_details_url
    assert_response :success
  end

  test "should get new" do
    get new_personil_detail_url
    assert_response :success
  end

  test "should create personil_detail" do
    assert_difference('PersonilDetail.count') do
      post personil_details_url, params: { personil_detail: { assignment_place_id: @personil_detail.assignment_place_id, email: @personil_detail.email, nama_lengkap: @personil_detail.nama_lengkap, nama_panggilan: @personil_detail.nama_panggilan, nomor_ponsel: @personil_detail.nomor_ponsel, position_id: @personil_detail.position_id, tim: @personil_detail.tim, user_id: @personil_detail.user_id } }
    end

    assert_redirected_to personil_detail_url(PersonilDetail.last)
  end

  test "should show personil_detail" do
    get personil_detail_url(@personil_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_personil_detail_url(@personil_detail)
    assert_response :success
  end

  test "should update personil_detail" do
    patch personil_detail_url(@personil_detail), params: { personil_detail: { assignment_place_id: @personil_detail.assignment_place_id, email: @personil_detail.email, nama_lengkap: @personil_detail.nama_lengkap, nama_panggilan: @personil_detail.nama_panggilan, nomor_ponsel: @personil_detail.nomor_ponsel, position_id: @personil_detail.position_id, tim: @personil_detail.tim, user_id: @personil_detail.user_id } }
    assert_redirected_to personil_detail_url(@personil_detail)
  end

  test "should destroy personil_detail" do
    assert_difference('PersonilDetail.count', -1) do
      delete personil_detail_url(@personil_detail)
    end

    assert_redirected_to personil_details_url
  end
end
