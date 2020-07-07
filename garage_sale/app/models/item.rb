class Item < ActiveRecord::Base
  validates :name, presence: true
    belongs_to :user

  def self.sort_alfa
    Item.all.sort_by{|item| item.name.downcase}
  end 

end 