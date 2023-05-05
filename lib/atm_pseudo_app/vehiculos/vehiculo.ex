defmodule AtmPseudoApp.Vehiculos.Vehiculo do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "vehiculos" do
    field :anio, :integer
    field :color, :string
    field :marca, :string
    field :modelo, :string
    field :placa, :string
    field :tipo, :string
    belongs_to :propietario, AtmPseudoApp.Propietarios.Propietario
    timestamps()
  end

  @doc false
  def changeset(vehiculo, attrs) do
    vehiculo
    |> cast(attrs, [:placa, :tipo, :marca, :modelo, :color, :anio, :propietario_id])
    |> validate_required([:placa, :tipo, :marca, :modelo, :color, :anio])
    |> validate_format(:placa, ~r/^[a-zA-Z]{3}-\d{4}$|^[a-zA-Z]{2}-\d{3}[a-zA-Z]$/, message: "Invalid placa")
    |> validate_length(:placa, max: 8, message: "Placa must have up to 8 characters")
    |> unique_constraint(:placa, message: "Placa already exists")
  end
end
