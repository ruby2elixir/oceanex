defmodule Oceanex.Resource.Action do
  @moduledoc """
  DigitalOcean `Action` resource api calls.
  """

  import Oceanex.Client

  @doc """
  List all actions
  """
  def all(opts \\ %{}), do: get("/actions", opts)

  @doc """
  Get a specific action.
  """
  def find(action_id), do: get("/actions/#{action_id}")
end
