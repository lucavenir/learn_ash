defmodule VeasytDashboard.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      VeasytDashboardWeb.Telemetry,
      VeasytDashboard.Repo,
      {DNSCluster, query: Application.get_env(:veasyt_dashboard, :dns_cluster_query) || :ignore},
      {Oban,
       AshOban.config(
         Application.fetch_env!(:veasyt_dashboard, :ash_domains),
         Application.fetch_env!(:veasyt_dashboard, Oban)
       )},
      {Phoenix.PubSub, name: VeasytDashboard.PubSub},
      # Start a worker by calling: VeasytDashboard.Worker.start_link(arg)
      # {VeasytDashboard.Worker, arg},
      # Start to serve requests, typically the last entry
      VeasytDashboardWeb.Endpoint,
      {Absinthe.Subscription, VeasytDashboardWeb.Endpoint},
      AshGraphql.Subscription.Batcher,
      {AshAuthentication.Supervisor, [otp_app: :veasyt_dashboard]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: VeasytDashboard.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VeasytDashboardWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
