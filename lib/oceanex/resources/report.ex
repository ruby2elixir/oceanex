defmodule Oceanex.Resource.Report do
  @moduledoc """
  DigitalOcean `Domain` resource api calls.
  """

  import Oceanex.Client

  @doc """
  List any droplets that are running on the same physical hardware.
  """
  def droplet_neighbors(opts \\ %{}), do: get("/reports/droplet_neighbors",
    opts)
  def droplet_neighbors!(opts \\ %{}), do: droplet_neighbors(opts) |> body!
end
