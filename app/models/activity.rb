class Activity < ApplicationRecord
  belongs_to :team
  belongs_to :notifiable, polymorphic: true
  belongs_to :actor, polymorphic: true

  after_create_commit :queue_post_process_job

  def queue_post_process_job
    PostActivityProcessJob.perform_later(self.id)
  end

  def description
    self.class.to_s
  end
end
