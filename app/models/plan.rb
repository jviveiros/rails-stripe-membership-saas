class Plan < ActiveRecord::Base
  include VGS::Plan

  has_many :users
  validates :vgs_id, inclusion: { in: Plan.pluck('DISTINCT vgs_id'),
      message: "not a valid subscription plan" }

  def redirect_path(subscription)
    '/'
  end

end
