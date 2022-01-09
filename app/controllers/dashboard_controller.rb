class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :user_in_organisation!

  def index
    @dashboard_metrics = repo.all
  end

  private

  def repo
    @repo ||= DashboardMetricSnapshotRepository.new(current_organisation, current_user)
  end
end
