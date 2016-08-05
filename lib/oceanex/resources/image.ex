defmodule Oceanex.Resource.Image do
  @moduledoc """
  DigitalOcean `Image` resource api calls.
  """

  import Oceanex.Client

  @doc """
  List all image records.
  """
  def all(opts \\ %{}), do: get("/images", opts)
  def all!(opts \\ %{}), do: all(opts) |> body!

  @doc """
  Get a specific image record.
  """
  def find(image_id), do: get("/images/#{image_id}")
  def find!(image_id), do: find(image_id) |> body!

  @doc """
  Update a image record.

  ### Examples

      Oceanex.Resource.Image.update(image_id, %{name: name})
  """
  def update(image_id, %{name: _} = opts), do:
    put("/images/#{image_id}", opts)
  def update!(image_id, opts), do: update(image_id, opts) |> body!

  @doc """
  Delete a specific image record.
  """
  def destroy(image_id), do: delete("/images/#{image_id}")
  def destroy!(image_id), do: destroy(image_id) |> body!
end
