class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  belongs_to :user
  
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end
  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end
end
