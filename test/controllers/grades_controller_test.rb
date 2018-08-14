require 'test_helper'

class GradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grade = grades(:one)
  end

  test "should get index" do
    get grades_url
    assert_response :success
  end

  test "should get new" do
    get new_grade_url
    assert_response :success
  end

  test "should create grade" do
    assert_difference('Grade.count') do
      post grades_url, params: { grade: { alumno_id: @grade.alumno_id, average: @grade.average, curso_id: @grade.curso_id, extra1: @grade.extra1, extra2: @grade.extra2, parcial1: @grade.parcial1, parcial2: @grade.parcial2, periodo_id: @grade.periodo_id, record_id: @grade.record_id } }
    end

    assert_redirected_to grade_url(Grade.last)
  end

  test "should show grade" do
    get grade_url(@grade)
    assert_response :success
  end

  test "should get edit" do
    get edit_grade_url(@grade)
    assert_response :success
  end

  test "should update grade" do
    patch grade_url(@grade), params: { grade: { alumno_id: @grade.alumno_id, average: @grade.average, curso_id: @grade.curso_id, extra1: @grade.extra1, extra2: @grade.extra2, parcial1: @grade.parcial1, parcial2: @grade.parcial2, periodo_id: @grade.periodo_id, record_id: @grade.record_id } }
    assert_redirected_to grade_url(@grade)
  end

  test "should destroy grade" do
    assert_difference('Grade.count', -1) do
      delete grade_url(@grade)
    end

    assert_redirected_to grades_url
  end
end
