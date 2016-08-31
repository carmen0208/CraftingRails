module MailForm
  class Base
    #resolve : ComplianceTest#test_errors_aref [/Users/carmenliu/.rvm/gems/ruby-2.0.0-p643/gems/activemodel-4.0.13/lib/active_model/lint.rb:101]:
    #The object should respond to to_model
    include ActiveModel::Conversion
    extend ActiveModel::Naming
    # support I18n test
    extend ActiveModel::Translation
    #resolve : ComplianceTest#test_errors_aref
    include ActiveModel::Validations
    
    include ActiveModel::AttributeMethods
    attribute_method_prefix 'clear_'
   
    # suffix 1. Add the attribute suffix
    attribute_method_suffix '?'
    def self.attributes(*names)
      attr_accessor(*names)
      # 3) Ask to define the prefix methods for the given attribute names
      define_attribute_methods(names)
    end

    #resolve: ComplianceTest#test_persisted? [/Users/carmenliu/.rvm/gems/ruby-2.0.0-p643/gems/activemodel-4.0.13/lib/active_model/lint.rb:70]:
    #The model should respond to persisted?
    def persisted?
      false
    end
    protected
    # 4) Since we declared a "clear_" prefix, it expects to have a​
    #"clear_attribute" method defined, which receives an attribute​
    # name and implements the clearing logic.​
    def clear_attribute(attribute)
      send("#{attribute}=", nil)
    end
    
    # suffix 2. Implement the logic required by the '?' suffix
    def attribute?(attribute)
      send(attribute).present?
    end

  end
end
