defmodule Postgrex.Mixfile do
  use Mix.Project

  @version "0.13.3"

  def project do
    [app: :postgrex,
     version: @version,
     elixir: "~> 1.3.4 or ~> 1.4",
     deps: deps(),
     name: "Postgrex",
     source_url: "https://github.com/jumpn/postgrex",
     preferred_cli_env: ["docs": :docs],
     docs: [source_ref: "v#{@version}", main: "readme", extras: ["README.md"]],
     description: description(),
     package: package()]
  end

  # Configuration for the OTP application
  def application do
    [applications: [:logger, :db_connection, :decimal, :crypto],
     mod: {Postgrex.App, []},
     env: [type_server_reap_after: 3 * 60_000]]
  end

  defp deps do
    [{:ex_doc, "~> 0.14", only: :docs},
     {:decimal, "~> 1.0"},
     {:db_connection, "~> 1.1"},
     {:connection, "~> 1.0"}]
  end

  defp description do
    "PostgreSQL driver for Elixir compatible with CockroachDB"
  end

  defp package do
    [maintainers: ["Christian Meunier"],
     name: "postgrex_cdb",
     licenses: ["Apache 2.0"],
     links: %{"Github" => "https://github.com/jumpn/postgrex"}]
  end
end
