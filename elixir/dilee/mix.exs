defmodule Dilee.Mixfile do
  use Mix.Project

  def project do
    [app: :dilee,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:poison, "~> 3.0"},{:cowboy, "~> 1.0"},{:plug, "~> 1.3"},{:ranch, "~> 1.2"},
     {:decimal, "~> 1.3"},{:poolboy, "~> 1.5"},{:hackney, "~> 1.6"},{:ecto, "~> 2.1.0-rc.5"},
     {:fs, "~> 2.11"},{:timex, "~> 3.1"},{:erlware_commons, "~> 1.0.0"},{:cachex, "~> 2.0.1"},
     {:remix, "~> 0.0.2"},{:pipe, "~> 0.0.2"},]
  end
end
