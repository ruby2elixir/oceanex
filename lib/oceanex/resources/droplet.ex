defmodule Oceanex.Resource.Droplet do
  @moduledoc """
  DigitalOcean `Droplet` resource api calls.
  """

  import Oceanex.Client

  @doc """
  List all droplet records.
  """
  def all(opts \\ %{}), do: get("/droplets", opts)

  @doc """
  Create a droplet record.

  ### Examples

      Oceanex.Resource.Droplet.create(%{name: name, region: region, size: size, image: image})
  """
  def create(%{name: name, region: region, size: size, image: image} = opts),
    do: post("/droplets", opts)

  @doc """
  Create multiple droplet records.

  ### Examples

      Oceanex.Resource.Droplet.create(%{names: names, region: region, size: size, image: image})
  """
  def create(%{names: names, region: region, size: size, image: image} = opts),
    do: post("/droplets", opts)

  @doc """
  Get a specific droplet record.
  """
  def find(droplet_id), do: get("/droplets/#{droplet_id}")

  @doc """
  Delete a specific droplet record.
  """
  def destroy(droplet_id), do: delete("/droplets/#{droplet_id}")

  @doc """
  Delete droplets by tag name.
  """
  def destroy_by_tag(tag_name), do: delete("/droplets", %{tag_name: tag_name})

  @doc """
  Get a specific droplet kernel records.
  """
  def kernels(droplet_id), do: get("/droplets/#{droplet_id}/kernels")

  @doc """
  Get a specific droplet snapshot records.
  """
  def snapshots(droplet_id), do: get("/droplets/#{droplet_id}/snapshots")

  @doc """
  Get a specific droplet backup records.
  """
  def backups(droplet_id), do: get("/droplets/#{droplet_id}/backups")

  @doc """
  Get a specific droplet action records.
  """
  def actions(droplet_id), do: get("/droplets/#{droplet_id}/actions")

  @doc """
  Get a specific droplet action records.
  """
  def action(droplet_id, action_id), do:
    get("/droplets/#{droplet_id}/actions/#{action_id}")

  @doc """
  Get a specific droplet neighbor records.
  """
  def neighbors(droplet_id), do: get("/droplets/#{droplet_id}/neighbors")

  @doc """
  Enable backups for a droplet.
  """
  def enable_backups(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "enable_backups"})

  @doc """
  Disable backups for a droplet.
  """
  def disable_backups(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "disable_backups"})

  @doc """
  Reboot a droplet.
  """
  def reboot(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "reboot"})

  @doc """
  Reboot a droplet.
  """
  def power_cycle(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "power_cycle"})

  @doc """
  Shutdown a droplet.
  """
  def shutdown(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "shutdown"})

  @doc """
  Power off a droplet.
  """
  def power_off(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "power_off"})

  @doc """
  Power on a droplet.
  """
  def power_on(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "power_on"})

  @doc """
  Restore a droplet.

  ### Examples

      Oceanex.Resource.Droplet.restore(droplet_id, %{image: image})
  """
  def restore(droplet_id, %{image: image} = opts),
    do: post("/droplets/#{droplet_id}/actions", Map.put(opts, :type, "restore"))

  @doc """
  Password reset on a droplet.
  """
  def password_reset(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "password_reset"})

  @doc """
  Resize a droplet.

  ### Examples

      Oceanex.Resource.Droplet.resize(droplet_id, %{size: size})
  """
  def resize(droplet_id, %{size: size} = opts),
    do: post("/droplets/#{droplet_id}/actions", Map.put(opts, :type, "resize"))

  @doc """
  Rebuild a droplet.

  ### Examples

      Oceanex.Resource.Droplet.rebuild(droplet_id, %{image: image})
  """
  def rebuild(droplet_id, %{image: image} = opts),
    do: post("/droplets/#{droplet_id}/actions", Map.put(opts, :type, "rebuild"))

  @doc """
  Rename a droplet.

  ### Examples

      Oceanex.Resource.Droplet.rename(droplet_id, %{name: name})
  """
  def rename(droplet_id, %{name: name} = opts),
    do: post("/droplets/#{droplet_id}/actions", Map.put(opts, :type, "rename"))

  @doc """
  Change kernel of a droplet.

  ### Examples

      Oceanex.Resource.Droplet.change_kernel(droplet_id, %{kernel: kernel})
  """
  def change_kernel(droplet_id, %{kernel: kernel} = opts),
    do: post("/droplets/#{droplet_id}/actions", Map.put(opts, :type,
          "change_kernel"))

  @doc """
  Enable IPv6 on a droplet.
  """
  def enable_ipv6(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type: "enable_ipv6"})

  @doc """
  Enable private networking on a droplet.
  """
  def enable_private_networking(droplet_id),
    do: post("/droplets/#{droplet_id}/actions", %{type:
          "enable_private_networking"})

  @doc """
  Take snapshot of a droplet.

  ### Examples

      Oceanex.Resource.Droplet.snapshot(droplet_id, %{name: name})
  """
  def snapshot(droplet_id, %{name: name} = opts),
    do: post("/droplets/#{droplet_id}/actions", Map.put(opts, :type,
          "snapshot"))

  @doc """
  Call actions on tagged droplets.

  ### Examples

      Oceanex.Resource.Droplet.actions_on_tagged(tag_name, %{type: type})
  """
  def actions_on_tagged(tag_name, %{type: type} = opts),
    do: post("/droplets/actions?tag_name=#{tag_name}", opts)
end
