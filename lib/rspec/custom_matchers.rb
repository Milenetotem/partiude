module CustomMatchers
  module ActiveRecord
    RSpec::Matchers.define :have_enumeration_for do |enum|

      chain :with do |custom_class|
        @custom_class = custom_class
      end

      match do |subject|
        if @custom_class
          @enum_class = @custom_class
          @custom_class = nil
        else
          @enum_class = enum.to_s.camelize.constantize
        end
        subject.class.enumerations[enum.to_sym].should eq @enum_class
      end

      failure_message_for_should do |subject|
        "#{subject.class} should have an enumeration on #{enum}. Enumerations: #{subject.class.enumerations.inspect}"
      end

      description do |enum|
        "have an enum for #{enum}"
      end
    end
  end
end
