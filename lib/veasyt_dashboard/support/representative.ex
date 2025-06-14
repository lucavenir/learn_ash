defmodule VeasytDashboard.Support.Representative do
  use Ash.Resource,
    domain: VeasytDashboard.Support,
    data_layer: Ash.DataLayer.Ets

  actions do
    defaults [:read]

    create :create do
      accept [:name]
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      public? true
    end
  end

  relationships do
    has_many :tickets, VeasytDashboard.Support.Ticket
  end
end
