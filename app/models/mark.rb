class Mark < ActiveRecord::Base
  belongs_to :markable, polymorphic: true
  belongs_to :author, class_name: 'User'
end
