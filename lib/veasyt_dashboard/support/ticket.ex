defmodule VeasytDashboard.Support.Ticket do
  use Ash.Resource,
    domain: VeasytDashboard.Support,
    data_layer: Ash.DataLayer.Ets

  actions do
    defaults [:read]

    create :open do
      accept [:subject]
    end

    update :close do
      accept []

      validate attribute_does_not_equal(:status, :closed) do
        message "Ticket is already closed"
      end

      change set_attribute(:status, :closed)
    end

    update :assign do
      accept [:representative_id]
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :subject, :string do
      allow_nil? false
      public? true
    end

    attribute :status, :atom do
      constraints one_of: [:open, :closed]
      allow_nil? false
      default :open
    end
  end

  relationships do
    belongs_to :representative, VeasytDashboard.Support.Representative
  end
end
