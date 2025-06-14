defmodule VeasytDashboard.Support do
  use Ash.Domain

  resources do
    resource VeasytDashboard.Support.Ticket
    resource VeasytDashboard.Support.Representative
  end
end
