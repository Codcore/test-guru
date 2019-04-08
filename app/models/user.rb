class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
  has_many :gists
  has_many :badges

  scope :tests_for_level, ->(level) { tests.where(level: level) }

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    type == 'Admin'
  end
end
