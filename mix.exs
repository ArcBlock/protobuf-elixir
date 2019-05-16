defmodule Protobuf.Mixfile do
  use Mix.Project

  @version "0.5.4"

  def project do
    [
      app: :protobuf,
      version: @version,
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript(),
      description: description(),
      package: package()
    ]
  end

  def application, do: []

  defp deps do
    [
      {:dialyxir, "~> 0.5", only: [:dev, :test], runtime: false},
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:eqc_ex, "~> 1.4", only: [:dev, :test]},
      {:recase, "~> 0.4", runtime: false}
    ]
  end

  defp escript do
    [main_module: Protobuf.Protoc.CLI, name: "protoc-gen-goldorin", app: nil]
  end

  defp description do
    "A pure Elixir implementation of Google Protobuf."
  end

  defp package do
    [
      maintainers: ["Bing Han", "Tyr Chen"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/tyrchen/protobuf-elixir"},
      files:
        ~w(mix.exs README.md lib/google lib/protobuf lib/protobuf.ex src config LICENSE priv/templates .formatter.exs)
    ]
  end
end
