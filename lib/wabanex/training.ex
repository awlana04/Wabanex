defmodule Wabanex.Training do
  use Ecto.Schema

  import Ecto.Changeset

  alias Wabanex.{User, Exercise}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields []

  schema "trainings" do
    field :start_date, :date
    field :end_date, :date

    belongs_to :user, User
    has_many :exercises, Exercise

    timestamps()
  end
end
