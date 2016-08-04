defmodule Oceanex.Resource.Size do
  @moduledoc """
  DigitalOcean `Size` resource api calls.
  """

  import Oceanex.Client

  @doc """
  List all size records.
  """
  def all(opts \\ %{}), do: get("/sizes", opts)
end
