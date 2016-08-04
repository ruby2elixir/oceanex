defmodule Oceanex.Resource.FloatingIP do
  @moduledoc """
  DigitalOcean `FloatingIP` resource api calls.
  """

  import Oceanex.Client

  @doc """
  List all FloatingIP records.
  """
  def all(opts \\ %{}), do: get("/floating_ips", opts)

  @doc """
  Create a FloatingIP record.
  """
  def create(%{droplet_id: _} = opts), do: post("/floating_ips", opts)

  @doc """
  Create a FloatingIP record.

  ### Examples

      Oceanex.Resource.FloatingIP.create(%{region: region})
  """
  def create(%{region: _} = opts), do: post("/floating_ips", opts)

  @doc """
  Get a specific FloatingIP record.
  """
  def find(floating_ip_addr), do: get("/floating_ips/#{floating_ip_addr}")

  @doc """
  Delete a specific FloatingIP record.
  """
  def destroy(floating_ip_addr), do: delete("/floating_ips/#{floating_ip_addr}")

  @doc """
  Assign a FloatingIP to a Droplet.

  ### Examples

      Oceanex.Resource.FloatingIP.assign(floating_ip_addr, %{droplet_id: droplet_id})
  """
  def assign(floating_ip_addr, %{droplet_id: _} = opts), do:
    post("/floating_ips/#{floating_ip_addr}/actions",
      Map.put(opts, :type, "assign"))

  @doc """
  Unassign a FloatingIP from a Droplet.
  """
  def unassign(floating_ip_addr, opts \\ %{}), do:
    post("/floating_ips/#{floating_ip_addr}/actions",
      Map.put(opts, :type, "unassign"))

  @doc """
  Get all action records that have been executed on a FloatingIP.
  """
  def actions(floating_ip_addr, opts \\ %{}), do:
    get("/floating_ips/#{floating_ip_addr}/actions", opts)

  @doc """
  Get a specific action record on a FloatingIP.
  """
  def action(floating_ip_addr, action_id), do:
    get("/floating_ips/#{floating_ip_addr}/actions/#{action_id}")
end
