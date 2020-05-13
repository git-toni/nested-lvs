defmodule Livesockets.Repo do
  use Ecto.Repo,
    otp_app: :livesockets,
    adapter: Ecto.Adapters.Postgres
end
