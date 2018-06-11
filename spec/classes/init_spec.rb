require 'spec_helper'

describe 'activemq' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('activemq') }
      it { is_expected.to contain_class('activemq::install') }

      context 'activemq when mco true' do
        let(:params) { { mco_config: true } }
        it { is_expected.to contain_class('activemq::mco') }
      end

    end
  end
end
