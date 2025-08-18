require 'vagrant/util/hash_with_indifferent_access'

module VagrantPlugins
  module VagrantLibvirt
    module Util
      class HashWithCompactBlank < ::Vagrant::Util::HashWithIndifferentAccess
        def compact_blank
          copy = self.dup
          copy.each do |k, _v|
            if copy[k].respond_to(:compact_blank)
              copy[k].compact_blank
            elsif copy[k].respond_to(:each_pair)
              copy[k].delete_if { |_k, v| v.to_s.empty? }
            else
              copy[k].reject! { |e| e.to_s.empty? }
            end
          end.delete_if { |_k, v| v.empty? }
        end
      end
    end
  end
end
