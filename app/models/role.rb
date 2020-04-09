class Role < ApplicationRecord
has_and_belongs_to_many :team_members, :join_table => :team_members_roles


belongs_to :resource,
           :polymorphic => true,
           :optional => true


validates :resource_type,
          :inclusion => { :in => Rolify.resource_types },
          :allow_nil => true

scopify
end