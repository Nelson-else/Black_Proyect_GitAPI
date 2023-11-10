require "application_system_test_case"

class EstudiantesTest < ApplicationSystemTestCase
  setup do
    @estudiante = estudiantes(:one)
  end

  test "visiting the index" do
    visit estudiantes_url
    assert_selector "h1", text: "Estudiantes"
  end

  test "should create estudiante" do
    visit estudiantes_url
    click_on "New estudiante"

    fill_in "Apellidos", with: @estudiante.apellidos
    fill_in "Carnet", with: @estudiante.carnet
    fill_in "Carrera", with: @estudiante.carrera
    fill_in "Celular", with: @estudiante.celular
    fill_in "Edad", with: @estudiante.edad
    fill_in "Fecha nacimiento", with: @estudiante.fecha_nacimiento
    fill_in "Nombres", with: @estudiante.nombres
    click_on "Create Estudiante"

    assert_text "Estudiante was successfully created"
    click_on "Back"
  end

  test "should update Estudiante" do
    visit estudiante_url(@estudiante)
    click_on "Edit this estudiante", match: :first

    fill_in "Apellidos", with: @estudiante.apellidos
    fill_in "Carnet", with: @estudiante.carnet
    fill_in "Carrera", with: @estudiante.carrera
    fill_in "Celular", with: @estudiante.celular
    fill_in "Edad", with: @estudiante.edad
    fill_in "Fecha nacimiento", with: @estudiante.fecha_nacimiento
    fill_in "Nombres", with: @estudiante.nombres
    click_on "Update Estudiante"

    assert_text "Estudiante was successfully updated"
    click_on "Back"
  end

  test "should destroy Estudiante" do
    visit estudiante_url(@estudiante)
    click_on "Destroy this estudiante", match: :first

    assert_text "Estudiante was successfully destroyed"
  end
end
