defmodule Oceanex.Resource.Action do
  @moduledoc """
  DigitalOcean `Action` resource api calls.
  """

  import Oceanex.Client

  @doc """
  List all actions
  """
  def all(opts \\ %{}), do: get("/actions", opts)
  def all!(opts \\ %{}), do: all(opts) |> body!

  @doc """
  Get a specific action.
  """
  def find(action_id), do: get("/actions/#{action_id}")
  def find!(action_id), do: find(action_id) |> body!
end
