defmodule VeasytDashboard.Secrets do
  use AshAuthentication.Secret

  def secret_for(
        [:authentication, :tokens, :signing_secret],
        VeasytDashboard.Accounts.User,
        _opts,
        _context
      ) do
    Application.fetch_env(:veasyt_dashboard, :token_signing_secret)
  end
end
