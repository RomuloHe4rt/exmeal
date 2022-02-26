defmodule Exmeal.ExuserTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  alias Ecto.Changeset
  alias Exmeal.User

  describe "changeset/1" do
    test "when the create params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{
               changes: %{
                 nome: "Rômulo",
                 email: "romulo@email.com",
                 cpf: "12345678910"
               },
               valid?: true
             } = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{}

      response = User.changeset(params)

      expected_response = %{
        cpf: ["can't be blank"],
        email: ["can't be blank"],
        nome: ["can't be blank"]
      }

      assert expected_response == errors_on(response)
    end
  end

  describe "changeset/2" do
    setup %{} do
      params = build(:user_params)

      changeset = User.changeset(params)

      {:ok, changeset: changeset}
    end

    test "when the update params are valid, returns a valid changeset", %{changeset: changeset} do
      params = %{nome: "Rômulo Silva"}

      response =
        changeset
        |> User.changeset(params)

      assert %Changeset{
               changes: %{
                 nome: "Rômulo Silva",
                 email: "romulo@email.com",
                 cpf: "12345678910"
               },
               valid?: true
             } = response
    end

    test "when there are some error, returns an invalid changeset", %{changeset: changeset} do
      params = %{nome: ""}

      response =
        changeset
        |> User.changeset(params)

      expected_response = %{
        nome: ["can't be blank"]
      }

      assert expected_response == errors_on(response)
    end
  end
end
