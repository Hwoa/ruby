class User < ApplicationRecord
  self.table_name = 'users'

  validates :name,  :presence => {:message =>'is required.'}
end
