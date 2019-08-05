require 'spec_helper_acceptance'
require_relative './version.rb'

describe 'eyplib class' do

  context 'basic setup' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      class { 'eyplib': }

      ->

      class { 'eyplib::setdescription':
        description => 'ACCEPTANCE TESTING',
      }

      ->

      class { 'eyplib::autobanner': }

      EOF

      # run several times - expect the 3rd run to be clean
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe file('/opt/eypconf/autobanner') do
      it { should be_file }
      its(:content) { should match 'ACCEPTANCE TESTING' }
    end

  end
end
