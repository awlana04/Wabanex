defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists, returns the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response =
        {:ok,
         %{
           "Awlana" => 27.68166089965398,
           "Henrique" => 29.396221429515126,
           "Ilka" => 33.12601406165495
         }}

      assert expected_response === response
    end

    test "when a wrong filename is given, returns an error" do
      params = %{"filename" => "banana.csv"}

      response = IMC.calculate(params)

      expected_response = {:error, "Error while opening the file"}

      assert expected_response === response
    end
  end
end
