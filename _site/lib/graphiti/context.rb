module Graphiti
  module Context
    extend ActiveSupport::Concern

    module Overrides
      def sideload_whitelist=(val)
        super(JSONAPI::IncludeDirective.new(val).to_hash)
      end
    end

    included do
      class_attribute :sideload_whitelist
      self.sideload_whitelist = {}
      class << self;prepend Overrides;end
    end
  end
end
