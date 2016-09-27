class User < ApplicationRecord
  validates :f_name, length: {minimum: 3}
  validates :l_name, length: {minimum: 3}
end
