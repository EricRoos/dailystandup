class PostActivityProcessJob < ApplicationJob
  queue_as :default

  def perform(activity_id)
    report = Activity.find(activity_id)
    Rails.logger.info("Queing Stat Tracking Job...")
    Rails.logger.info("Queing Notification Job...")
  end
end
