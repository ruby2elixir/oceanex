defmodule Oceanex.Resource.Size do
  @moduledoc """
  DigitalOcean `Size` resource api calls.
  """

  import Oceanex.Client

  @doc """
  List all size records.
  """
  def all(opts \\ %{}), do: get("/sizes", opts)
  def all!(opts \\ %{}), do: all(opts) |> body!
end
