defmodule Oceanex.Resource.Domain do
  @moduledoc """
  DigitalOcean `Domain` resource api calls.
  """

  import Oceanex.Client

  @doc """
  List all domain records.
  """
  def all(opts \\ %{}), do: get("/domains", opts)
  def all!(opts \\ %{}), do: all(opts) |> body!

  @doc """
  Create a domain record.

  ### Examples

      Oceanex.Resource.Domain.create(%{name: name, ip_address: ip_address})
  """
  def create(%{name: _, ip_address: _} = opts), do: post("/domains",
    opts)
  def create!(opts), do: create(opts) |> body!

  @doc """
  Get a specific domain record.
  """
  def find(domain_name), do: get("/domains/#{domain_name}")
  def find!(domain_name), do: find(domain_name) |> body!

  @doc """
  Delete a specific domain record.
  """
  def destroy(domain_name), do: delete("/domains/#{domain_name}")
  def destroy!(domain_name), do: destroy(domain_name) |> body!
end
