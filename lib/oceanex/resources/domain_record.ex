defmodule Oceanex.Resource.DomainRecord do
  @moduledoc """
  DigitalOcean `DomainRecord` resource api calls.
  """

  import Oceanex.Client

  @doc """
  Get a listing of all records configured for a domain.
  """
  def all(domain_name, opts \\ %{}), do:
    get("/domains/#{domain_name}/records", opts)

  @doc """
  Create a new record to a domain.

  ### Examples

      Oceanex.Resource.DomainRecord.create(domain_name, %{type: type, name: name, data: data,
      priority: priority, port: port, weight: weight})
  """
  def create(domain_name, %{type: type, name: name, data: data,
    priority: priority, port: port, weight: weight} = opts), do:
    post("/domains/#{domain_name}/records", opts)

  @doc """
  Create a new record to a domain.
  """
  def find(domain_name, record_id), do:
    get("/domains/#{domain_name}/records/#{record_id}")

  @doc """
  Create a new record to a domain.

  ### Examples

      Oceanex.Resource.DomainRecord.update(domain_name, record_id, %{type: type, name: name, data: data,
      priority: priority, port: port, weight: weight})
  """
  def update(domain_name, record_id, %{type: type, name: name, data: data,
    priority: priority, port: port, weight: weight} = opts), do:
    put("/domains/#{domain_name}/records#{record_id}", opts)

  @doc """
  Create a new record to a domain.
  """
  def destroy(domain_name, record_id), do:
    delete("/domains/#{domain_name}/records/#{record_id}")
end
