defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.Users.Create

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{email: "johndoe123@gmail.com", password: "123123", name: "Jonh Doe"}

      {:ok, %User{id: user_id}} = Create.call(params)

      query = """
      query {
        getUser(id: "#{user_id}") {
          name
          email
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "johndoe123@gmail.com",
            "name" => "Jonh Doe"
          }
        }
      }

      assert expected_response == response
    end
  end

  describe "users mutation" do
    test "when all params are valid, creates the user", %{conn: conn} do
      mutation = """
      mutation {
        createUser(input: {
          email: "johndoe123@gmail.com"
          password: "123123"
          name: "Jonh Doe"
        }) {
          id
          email
          name
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{
               "data" => %{
                 "createUser" => %{
                   "email" => "johndoe123@gmail.com",
                   "id" => _id,
                   "name" => "Jonh Doe"
                 }
               }
             } = response
    end
  end
end
