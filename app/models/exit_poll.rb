class ExitPoll < ActiveRecord::Base
  attr_accessible :amlo, :epn, :gqt, :jvm, :null, :other

  def self.create_vote(vote_to)
    object = self.new
    case vote_to
    when 'jvm'
      object.jvm = true
    when 'epn'
      object.epn = true
    when 'amlo'
      object.amlo = true
    when 'gqt'
      object.gqt = true
    when 'others'
      object.other
    when 'null'
      object.null = true
    end
    object.save
  end
end
