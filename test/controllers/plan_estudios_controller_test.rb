require 'test_helper'

class PlanEstudiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plan_estudio = plan_estudios(:one)
  end

  test "should get index" do
    get plan_estudios_url
    assert_response :success
  end

  test "should get new" do
    get new_plan_estudio_url
    assert_response :success
  end

  test "should create plan_estudio" do
    assert_difference('PlanEstudio.count') do
      post plan_estudios_url, params: { plan_estudio: { clave: @plan_estudio.clave, fin_vigencia: @plan_estudio.fin_vigencia, inicio_vigencia: @plan_estudio.inicio_vigencia, semestre: @plan_estudio.semestre } }
    end

    assert_redirected_to plan_estudio_url(PlanEstudio.last)
  end

  test "should show plan_estudio" do
    get plan_estudio_url(@plan_estudio)
    assert_response :success
  end

  test "should get edit" do
    get edit_plan_estudio_url(@plan_estudio)
    assert_response :success
  end

  test "should update plan_estudio" do
    patch plan_estudio_url(@plan_estudio), params: { plan_estudio: { clave: @plan_estudio.clave, fin_vigencia: @plan_estudio.fin_vigencia, inicio_vigencia: @plan_estudio.inicio_vigencia, semestre: @plan_estudio.semestre } }
    assert_redirected_to plan_estudio_url(@plan_estudio)
  end

  test "should destroy plan_estudio" do
    assert_difference('PlanEstudio.count', -1) do
      delete plan_estudio_url(@plan_estudio)
    end

    assert_redirected_to plan_estudios_url
  end
end
