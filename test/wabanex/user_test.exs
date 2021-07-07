defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{email: "cawlana040@gmail.com", password: "123456", name: "Awlana Costa"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{
                 email: "cawlana040@gmail.com",
                 name: "Awlana Costa",
                 password: "123456"
               },
               errors: []
             } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{email: "cawlana040@gmail.com", password: "123456", name: "A"}

      response = User.changeset(params)

      expected_response = %{name: ["should be at least 2 character(s)"]}

      assert errors_on(response) == expected_response
    end
  end
end
