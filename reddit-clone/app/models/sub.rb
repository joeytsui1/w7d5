class Sub < ApplicationRecord
    validates :title, presence: true
    before_actions :

    belongs_to :moderator,
        foreign_key: :moderator_id,
        class_name: :User,
        inverse_of: :subs
end
