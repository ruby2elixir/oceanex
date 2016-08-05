defmodule Oceanex.Resource.Account do
  @moduledoc """
  DigitalOcean `Account` resource api calls.
  """

  import Oceanex.Client

  @doc """
  Get user information
  """
  def info, do: get("/account")
  def info!, do: info |> body!
end
