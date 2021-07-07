defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, returns the imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      expected_response = %{
        "result" => %{
          "Awlana" => 27.68166089965398,
          "Henrique" => 29.396221429515126,
          "Ilka" => 33.12601406165495
        }
      }

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      assert expected_response == response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{"filename" => "banana.csv"}

      expected_response = %{"result" => "Error while opening the file"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      assert expected_response == response
    end
  end
end
