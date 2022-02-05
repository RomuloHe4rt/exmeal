defmodule Exmeal.Repo.Migrations.CreateMealTable do
  use Ecto.Migration

  def change do
    create table(:foods) do
      add :description, :string
      add :date, :string
      add :calories, :integer

      timestamps()
    end
  end
end
