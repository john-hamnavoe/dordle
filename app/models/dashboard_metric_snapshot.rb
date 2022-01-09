class DashboardMetricSnapshot < ApplicationRecord
  belongs_to :organisation
  belongs_to :dashboard_metric
end
