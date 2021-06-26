defmodule WabanexWeb.Schema do
  use Absinthe.Schema

  import_types WabanexWeb.Schemas.Types.Root

  query do
    import_fields :root_query
  end
end
