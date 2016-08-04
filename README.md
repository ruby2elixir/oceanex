# Oceanex

DigitalOcean V2 API Elixir Client library (unofficial)

## Installation

The package can be installed as:

  1. Add `oceanex` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:oceanex, "~> 0.1.0"}]
    end
    ```

  2. Ensure `oceanex` is started before your application:

    ```elixir
    def application do
      [applications: [:oceanex]]
    end
    ```

  3. Add your configuration to your config/config.exs

    ```elixir
    config :oceanex,
      api_base_uri: "https://api.digitalocean.com/v2",
      access_token: System.get_env("DIGITALOCEAN_ACCESS_TOKEN") || "",
      decoder: :atoms # :atoms (not efficient), :string (suggested, most efficient)
    ```

## Usage

Please refer to https://hexdocs.pm/oceanex

## Contributing

### Issues, Bugs, Documentation, Enhancements

1) Fork the project

2) Make your improvements and write your tests.

3) Make a pull request.
