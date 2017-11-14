require 'spec_helper'
describe 'testmod', type: :class do
  context 'supported operating systems' do
    on_supported_os(requested_facterversion).each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts.merge(
            my_fact: 'rspec_test',
          )
        end

        context 'testmod with default params' do
          it { is_expected.to compile.with_all_deps }
        end
      end
    end
  end
end
