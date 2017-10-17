class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validate :is_clickbait?
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}

  def is_clickbait?
    array = ["Won't Believe", "Secret", "Guess", "Top"]
    array.any? { |term| self.title.to_s.include?(term)} || errors.add(:title, "isn't clickbait")
  end
end
