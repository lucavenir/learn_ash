defmodule VeasytDashboard.Accounts do
  use Ash.Domain, otp_app: :veasyt_dashboard, extensions: [AshAdmin.Domain]

  admin do
    show? true
  end

  resources do
    resource VeasytDashboard.Accounts.Token
    resource VeasytDashboard.Accounts.User
    resource VeasytDashboard.Accounts.ApiKey
  end
end
