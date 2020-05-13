class PostActivityProcessJob < ApplicationJob
  queue_as :default

  def perform(activity_id)
    report = Activity.find(activity_id)
    Rails.logger.info "PROCESSING ACTIVITY: #{report}"
  end
end
