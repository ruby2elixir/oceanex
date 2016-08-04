defmodule Oceanex.Resource.Image do
  @moduledoc """
  DigitalOcean `Image` resource api calls.
  """

  import Oceanex.Client

  @doc """
  List all image records.
  """
  def all(opts \\ %{}), do: get("/images", opts)

  @doc """
  Get a specific image record.
  """
  def find(image_id), do: get("/images/#{image_id}")

  @doc """
  Update a image record.

  ### Examples

      Oceanex.Resource.Image.update(image_id, %{name: name})
  """
  def update(image_id, %{name: name} = opts), do:
    put("/images/#{image_id}", opts)

  @doc """
  Delete a specific image record.
  """
  def destroy(image_id), do: delete("/images/#{image_id}")
end
