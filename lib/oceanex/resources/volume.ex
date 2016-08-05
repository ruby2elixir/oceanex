defmodule Oceanex.Resource.Volume do
  @moduledoc """
  DigitalOcean `BlockStorage` and `BlockStorageAction` resource api calls.
  """

  import Oceanex.Client

  @doc """
  List all volume records.
  """
  def all(opts \\ %{}), do: get("/volumes", opts)
  def all!(opts \\ %{}), do: all(opts) |> body!

  @doc """
  Create a volume record.

  Optional vars: description

  ### Examples

      Oceanex.Resource.Volume.create(%{size_gigabytes: size_gigabytes, name: name, region: region})
  """
  def create(%{size_gigabytes: _, name: _, region: _} = opts), do:
    post("/volumes", opts)
  def create!(opts), do: create(opts) |> body!

  @doc """
  Get a specific volume record with drive_id or drive_name.
  """
  def find(drive_id_or_name, opts \\ %{}), do:
    get("/volumes/#{drive_id_or_name}", opts)
  def find!(drive_id_or_name, opts \\ %{}), do:
    find(drive_id_or_name, opts) |> body!

  @doc """
  Delete a specific volume record with drive_id or drive_name.
  """
  def destroy(drive_id_or_name, opts \\ %{}), do:
    delete("/volumes/#{drive_id_or_name}", opts)
  def destroy!(drive_id_or_name, opts \\ %{}), do:
    destroy(drive_id_or_name, opts) |> body!

  @doc """
  Attach a Block Storage volume to a Droplet by volume id or name.

  ### Examples

      Oceanex.Resource.Volume.attach(volume_id, %{droplet_id: droplet_id, region: region})

      Oceanex.Resource.Volume.attach(%{droplet_id: droplet_id, volume_name: volume_name, region: region})
  """
  def attach(volume_id, %{droplet_id: _, region: _} = opts), do:
    post("/volumes/#{volume_id}/actions", Map.put(opts, :type, "attach"))
  def attach!(volume_id, opts), do: attach(volume_id, opts) |> body!
  def attach(%{droplet_id: _, volume_name: _, region: _} = opts), do:
    post("/volumes/actions", Map.put(opts, :type, "attach"))
  def attach!(opts), do: attach(opts) |> body!

  @doc """
  Detach a Block Storage volume from a Droplet by volume id or name.

  ### Examples

      Oceanex.Resource.Volume.detach(volume_id, %{droplet_id: droplet_id, region: region})

      Oceanex.Resource.Volume.detach(%{droplet_id: droplet_id, volume_name: volume_name, region: region})
  """
  def detach(volume_id, %{droplet_id: _, region: _} = opts), do:
    post("/volumes/#{volume_id}/actions", Map.put(opts, :type, "detach"))
  def detach!(volume_id, opts), do: detach(volume_id, opts) |> body!
  def detach(%{droplet_id: _, volume_name: _, region: _} = opts),
    do: post("/volumes/actions", Map.put(opts, :type, "detach"))
  def detach!(opts), do: detach(opts) |> body!

  @doc """
  To resize a Block Storage volume.

  ### Examples

      Oceanex.Resource.Volume.resize(drive_id, %{size_gigabytes: size_gigabytes, region: region})
  """
  def resize(drive_id, %{size_gigabytes: _, region: _} = opts), do:
    post("/volumes/#{drive_id}/actions", Map.put(opts, :type, "resize"))
  def resize!(drive_id, opts), do: resize(drive_id, opts) |> body!

  @doc """
  Get all action records that have been executed on a volume.
  """
  def actions(drive_id, opts \\ %{}), do: get("/volumes/#{drive_id}/actions",
    opts)
  def actions!(drive_id, opts \\ %{}), do: actions(drive_id, opts) |> body!

  @doc """
  Get a specific action record.
  """
  def action(drive_id, action_id), do:
    get("/volumes/#{drive_id}/actions/#{action_id}")
  def action!(drive_id, action_id), do: action(drive_id, action_id) |> body!
end
