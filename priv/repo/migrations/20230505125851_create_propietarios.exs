defmodule AtmPseudoApp.Repo.Migrations.CreatePropietarios do
  use Ecto.Migration

  def change do
    create table(:propietarios, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :num_id, :string
      add :nombres, :string
      add :apellidos, :string
      add :fecha_nac, :date

      timestamps()
    end

    create unique_index(:propietarios, [:num_id])
  end
end
