class Transition
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :workflow_state
  belongs_to :workflow_event
end
