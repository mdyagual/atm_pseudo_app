defmodule AtmPseudoApp.PropietariosTest do
  use AtmPseudoApp.DataCase

  alias AtmPseudoApp.Propietarios

  describe "propietarios" do
    alias AtmPseudoApp.Propietarios.Propietario

    import AtmPseudoApp.PropietariosFixtures

    @invalid_attrs %{apellidos: nil, fecha_nac: nil, nombres: nil, num_id: nil}

    test "list_propietarios/0 returns all propietarios" do
      propietario = propietario_fixture()
      assert Propietarios.list_propietarios() == [propietario]
    end

    test "get_propietario!/1 returns the propietario with given id" do
      propietario = propietario_fixture()
      assert Propietarios.get_propietario!(propietario.id) == propietario
    end

    test "create_propietario/1 with valid data creates a propietario" do
      valid_attrs = %{apellidos: "some apellidos", fecha_nac: ~D[2023-05-04], nombres: "some nombres", num_id: "some num_id"}

      assert {:ok, %Propietario{} = propietario} = Propietarios.create_propietario(valid_attrs)
      assert propietario.apellidos == "some apellidos"
      assert propietario.fecha_nac == ~D[2023-05-04]
      assert propietario.nombres == "some nombres"
      assert propietario.num_id == "some num_id"
    end

    test "create_propietario/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Propietarios.create_propietario(@invalid_attrs)
    end

    test "update_propietario/2 with valid data updates the propietario" do
      propietario = propietario_fixture()
      update_attrs = %{apellidos: "some updated apellidos", fecha_nac: ~D[2023-05-05], nombres: "some updated nombres", num_id: "some updated num_id"}

      assert {:ok, %Propietario{} = propietario} = Propietarios.update_propietario(propietario, update_attrs)
      assert propietario.apellidos == "some updated apellidos"
      assert propietario.fecha_nac == ~D[2023-05-05]
      assert propietario.nombres == "some updated nombres"
      assert propietario.num_id == "some updated num_id"
    end

    test "update_propietario/2 with invalid data returns error changeset" do
      propietario = propietario_fixture()
      assert {:error, %Ecto.Changeset{}} = Propietarios.update_propietario(propietario, @invalid_attrs)
      assert propietario == Propietarios.get_propietario!(propietario.id)
    end

    test "delete_propietario/1 deletes the propietario" do
      propietario = propietario_fixture()
      assert {:ok, %Propietario{}} = Propietarios.delete_propietario(propietario)
      assert_raise Ecto.NoResultsError, fn -> Propietarios.get_propietario!(propietario.id) end
    end

    test "change_propietario/1 returns a propietario changeset" do
      propietario = propietario_fixture()
      assert %Ecto.Changeset{} = Propietarios.change_propietario(propietario)
    end
  end
end
