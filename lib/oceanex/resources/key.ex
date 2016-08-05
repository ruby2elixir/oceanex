defmodule Oceanex.Resource.Key do
  @moduledoc """
  DigitalOcean `SSH Key` resource api calls.
  """

  import Oceanex.Client

  @doc """
  List all ssh key records.
  """
  def all(opts \\ %{}), do: get("/account/keys", opts)
  def all!(opts \\ %{}), do: all(opts) |> body!

  @doc """
  Create a ssh key record.
  """
  def create(%{name: _, public_key: _} = opts), do:
    post("/account/keys", opts)
  def create!(opts), do: create(opts) |> body!

  @doc """
  Get a specific ssh key record.
  """
  def find(key_id_or_key_finger_print), do:
    get("/account/keys/#{key_id_or_key_finger_print}")
  def find!(key_id_or_key_finger_print), do:
    find(key_id_or_key_finger_print) |> body!

  @doc """
  Update a specific ssh key record.

  ### Examples

      Oceanex.Resource.Key.update(key_id_or_key_finger_print, %{name: name})
  """
  def update(key_id_or_key_finger_print, %{name: _} = opts), do:
    put("/account/keys/#{key_id_or_key_finger_print}", opts)
  def update!(key_id_or_key_finger_print, opts), do:
    update(key_id_or_key_finger_print, opts) |> body!

  @doc """
  Delete a specific ssh key record.
  """
  def destroy(key_id_or_key_finger_print), do:
    delete("/account/keys/#{key_id_or_key_finger_print}")
  def destroy!(key_id_or_key_finger_print), do:
    destroy(key_id_or_key_finger_print) |> body!
end
