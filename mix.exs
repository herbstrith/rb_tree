defmodule RedBlackTree.MixProject do
  use Mix.Project

  def project do
    [
      app: :rb_tree,
      version: "1.0.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # Docs
      name: "RedBlackTree",
      source_url: "https://github.com/herbstrith/rb_tree",
      homepage_url: "https://github.com/herbstrith/rb_tree",
      docs: [
        main: "RedBlackTree", # The main page in the docs
        extras: ["README.md"]
      ],
      test_coverage: [tool: ExCoveralls]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:excoveralls, github: "parroty/excoveralls"}
    ]
  end
end
