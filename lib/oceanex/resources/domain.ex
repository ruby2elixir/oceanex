defmodule Oceanex.Resource.Domain do
  @moduledoc """
  DigitalOcean `Domain` resource api calls.
  """

  import Oceanex.Client

  @doc """
  List all domain records.
  """
  def all(opts \\ %{}), do: get("/domains", opts)

  @doc """
  Create a domain record.

  ### Examples

      Oceanex.Resource.Domain.create(%{name: name, ip_address: ip_address})
  """
  def create(%{name: name, ip_address: ip_address} = opts), do: post("/domains",
    opts)

  @doc """
  Get a specific domain record.
  """
  def find(domain_name), do: get("/domains/#{domain_name}")

  @doc """
  Delete a specific domain record.
  """
  def destroy(domain_name), do: delete("/domains/#{domain_name}")
end
