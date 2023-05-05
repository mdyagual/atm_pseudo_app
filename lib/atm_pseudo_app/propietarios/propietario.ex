defmodule AtmPseudoApp.Propietarios.Propietario do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "propietarios" do
    field :apellidos, :string
    field :fecha_nac, :date
    field :nombres, :string
    field :num_id, :string
    has_many :vehiculos, AtmPseudoApp.Vehiculos.Vehiculo
    timestamps()
  end

  @doc false
  def changeset(propietario, attrs) do
    propietario
    |> cast(attrs, [:num_id, :nombres, :apellidos, :fecha_nac])
    |> validate_required([:num_id, :nombres, :apellidos, :fecha_nac])
    |> validate_length(:num_id, max: 10, message: "Identification (num_id) must have up to 10 digits")
    |> unique_constraint(:num_id, message: "Propietario already exists with this identification (num_id)")

  end
end
