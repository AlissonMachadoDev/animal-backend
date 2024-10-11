defmodule AnimalBackendWeb.ErrorJSONTest do
  use AnimalBackendWeb.ConnCase, async: true

  test "renders 404" do
    assert AnimalBackendWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert AnimalBackendWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
