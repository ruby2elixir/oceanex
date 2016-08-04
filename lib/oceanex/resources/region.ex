defmodule Oceanex.Resource.Region do
  @moduledoc """
  DigitalOcean `Region` resource api calls.
  """

  import Oceanex.Client

  @doc """
  List all region records.
  """
  def all(opts \\ %{}), do: get("/regions", opts)
end
