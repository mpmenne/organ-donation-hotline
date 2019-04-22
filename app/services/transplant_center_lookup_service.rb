class TransplantCenterLookupService < ApplicationService

  def initialize(state)
    @state = state
  end

  def call
    centers = TransplantCenter.where(state: @state.upcase)
    if centers.present?
      centers[rand(centers.count - 1)]
    else
      raise Errors::InvalidStateError.new('No transplant centers are populated in the database') if TransplantCenter.all.empty?
      TransplantCenter.all[rand(centers.count - 1)]
    end
  end

end
