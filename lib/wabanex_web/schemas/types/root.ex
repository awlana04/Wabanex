defmodule WabanexWeb.Schemas.Types.Root do
  use Absinthe.Schema.Notation

  alias WabanexWeb.Resolvers.User, as: UserResolver

  import_types WabanexWeb.Schemas.Types.User

  @desc "Login root representation"
  object :root_query do
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)

      resolve &UserResolver.get/2
    end
  end
end
