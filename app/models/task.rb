class Task < ActiveRecord::Base
  attr_accessible :body, :subject, :editor_ids

  before_save :set_shared_status

  belongs_to :user

  has_and_belongs_to_many :editors, class_name: User

  validates :subject, presence: true
  validates :user_id, presence: true


  def set_shared_status
    if editor_ids.present?
      self.shared = true
    end
  end

end
