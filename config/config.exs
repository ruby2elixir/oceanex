# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :oceanex,
  api_base_uri: "https://api.digitalocean.com/v2",
  access_token: System.get_env("DIGITALOCEAN_ACCESS_TOKEN") || "",
  decoder: :atoms # :atoms (not efficient), :string (suggested, most efficient)
