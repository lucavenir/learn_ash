defmodule Veasyt.Accounts do
  use Ash.Domain, otp_app: :veasyt, extensions: [AshAdmin.Domain]

  admin do
    show? true
  end

  resources do
    resource Veasyt.Accounts.Token
    resource Veasyt.Accounts.User
  end
end
