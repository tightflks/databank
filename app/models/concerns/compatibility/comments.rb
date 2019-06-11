module Compatibility::Comments

  def comments
    (1..10).collect do |i|
      value = self["M#{i}"]
      value unless value.blank?
    end.compact
  end

end
