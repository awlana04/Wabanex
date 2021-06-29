defmodule WabanexWeb.Schemas.Types.Root do
  use Absinthe.Schema.Notation

  alias WabanexWeb.Resolvers.User, as: UserResolver
  alias Crudry.Middlewares.TranslateErrors

  import_types WabanexWeb.Schemas.Types.User

  @desc "Login root representation"
  object :root_query do
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)

      resolve &UserResolver.get/2
    end
  end

  object :root_mutation do
    field :create_user, type: :user do
      arg :input, non_null(:create_user_input)

      resolve &UserResolver.create/2

      middleware TranslateErrors
    end
  end
end
