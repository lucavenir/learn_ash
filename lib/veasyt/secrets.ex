defmodule Veasyt.Secrets do
  use AshAuthentication.Secret

  def secret_for(
        [:authentication, :tokens, :signing_secret],
        Veasyt.Accounts.User,
        _opts,
        _context
      ) do
    Application.fetch_env(:veasyt, :token_signing_secret)
  end
end
