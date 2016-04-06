class User < ActiveRecord::Base
    serialize :matches
end
