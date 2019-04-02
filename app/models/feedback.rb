class Feedback

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :title, :email, :text

  validates_presence_of :title, :email, :text
  validates_length_of :title, :minimum => 10, maximum: 60
  validates_format_of :email, :with => /[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}/i

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def admin_email
    Admin.first.email
  end
end
