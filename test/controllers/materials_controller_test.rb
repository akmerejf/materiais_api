require 'test_helper'

class MaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material = materials(:one)
  end

  test "should get index" do
    get materials_url, as: :json
    assert_response :success
  end

  test "should create material" do
    assert_difference('Material.count') do
      post materials_url, params: { material: { cad_data: @material.cad_data, code: @material.code, preco: @material.preco, title: @material.title } }, as: :json
    end

    assert_response 201
  end

  test "should show material" do
    get material_url(@material), as: :json
    assert_response :success
  end

  test "should update material" do
    patch material_url(@material), params: { material: { cad_data: @material.cad_data, code: @material.code, preco: @material.preco, title: @material.title } }, as: :json
    assert_response 200
  end

  test "should destroy material" do
    assert_difference('Material.count', -1) do
      delete material_url(@material), as: :json
    end

    assert_response 204
  end
end
