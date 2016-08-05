defmodule Oceanex.Resource.FloatingIP do
  @moduledoc """
  DigitalOcean `FloatingIP` resource api calls.
  """

  import Oceanex.Client

  @doc """
  List all FloatingIP records.
  """
  def all(opts \\ %{}), do: get("/floating_ips", opts)
  def all!(opts \\ %{}), do: all(opts) |> body!

  @doc """
  Create a FloatingIP record.

  ### Examples

      Oceanex.Resource.FloatingIP.create(%{droplet_id: droplet_id})

      Oceanex.Resource.FloatingIP.create(%{region: region})
  """
  def create(%{droplet_id: _} = opts), do: post("/floating_ips", opts)
  def create(%{region: _} = opts), do: post("/floating_ips", opts)
  def create!(opts), do: create(opts) |> body!

  @doc """
  Get a specific FloatingIP record.
  """
  def find(floating_ip_addr), do: get("/floating_ips/#{floating_ip_addr}")
  def find!(floating_ip_addr), do: find(floating_ip_addr) |> body!

  @doc """
  Delete a specific FloatingIP record.
  """
  def destroy(floating_ip_addr), do: delete("/floating_ips/#{floating_ip_addr}")
  def destroy!(floating_ip_addr), do: destroy(floating_ip_addr) |> body!

  @doc """
  Assign a FloatingIP to a Droplet.

  ### Examples

      Oceanex.Resource.FloatingIP.assign(floating_ip_addr, %{droplet_id: droplet_id})
  """
  def assign(floating_ip_addr, %{droplet_id: _} = opts), do:
    post("/floating_ips/#{floating_ip_addr}/actions",
      Map.put(opts, :type, "assign"))
  def assign!(floating_ip_addr, opts), do:
    assign(floating_ip_addr, opts) |> body!

  @doc """
  Unassign a FloatingIP from a Droplet.
  """
  def unassign(floating_ip_addr, opts \\ %{}), do:
    post("/floating_ips/#{floating_ip_addr}/actions",
      Map.put(opts, :type, "unassign"))
  def unassign!(floating_ip_addr, opts \\ %{}), do:
    unassign(floating_ip_addr, opts) |> body!

  @doc """
  Get all action records that have been executed on a FloatingIP.
  """
  def actions(floating_ip_addr, opts \\ %{}), do:
    get("/floating_ips/#{floating_ip_addr}/actions", opts)
  def actions!(floating_ip_addr, opts \\ %{}), do:
    actions(floating_ip_addr, opts) |> body!

  @doc """
  Get a specific action record on a FloatingIP.
  """
  def action(floating_ip_addr, action_id), do:
    get("/floating_ips/#{floating_ip_addr}/actions/#{action_id}")
  def action!(floating_ip_addr, action_id), do:
    action(floating_ip_addr, action_id) |> body!
end
