defmodule AtmPseudoApp.Repo.Migrations.CreateVehiculos do
  use Ecto.Migration

  def change do
    create table(:vehiculos, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :placa, :string
      add :tipo, :string
      add :marca, :string
      add :modelo, :string
      add :color, :string
      add :anio, :integer
      add :propietario_id, references(:propietarios, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:vehiculos, [:propietario_id, :placa])
  end
end
