defmodule AtmPseudoAppWeb.PropietarioControllerTest do
  use AtmPseudoAppWeb.ConnCase

  import AtmPseudoApp.PropietariosFixtures

  alias AtmPseudoApp.Propietarios.Propietario

  @create_attrs %{
    apellidos: "some apellidos",
    fecha_nac: ~D[2023-05-04],
    nombres: "some nombres",
    num_id: "some num_id"
  }
  @update_attrs %{
    apellidos: "some updated apellidos",
    fecha_nac: ~D[2023-05-05],
    nombres: "some updated nombres",
    num_id: "some updated num_id"
  }
  @invalid_attrs %{apellidos: nil, fecha_nac: nil, nombres: nil, num_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all propietarios", %{conn: conn} do
      conn = get(conn, Routes.propietario_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create propietario" do
    test "renders propietario when data is valid", %{conn: conn} do
      conn = post(conn, Routes.propietario_path(conn, :create), propietario: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.propietario_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "apellidos" => "some apellidos",
               "fecha_nac" => "2023-05-04",
               "nombres" => "some nombres",
               "num_id" => "some num_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.propietario_path(conn, :create), propietario: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update propietario" do
    setup [:create_propietario]

    test "renders propietario when data is valid", %{conn: conn, propietario: %Propietario{id: id} = propietario} do
      conn = put(conn, Routes.propietario_path(conn, :update, propietario), propietario: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.propietario_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "apellidos" => "some updated apellidos",
               "fecha_nac" => "2023-05-05",
               "nombres" => "some updated nombres",
               "num_id" => "some updated num_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, propietario: propietario} do
      conn = put(conn, Routes.propietario_path(conn, :update, propietario), propietario: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete propietario" do
    setup [:create_propietario]

    test "deletes chosen propietario", %{conn: conn, propietario: propietario} do
      conn = delete(conn, Routes.propietario_path(conn, :delete, propietario))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.propietario_path(conn, :show, propietario))
      end
    end
  end

  defp create_propietario(_) do
    propietario = propietario_fixture()
    %{propietario: propietario}
  end
end
