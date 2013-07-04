require 'spec_helper'

describe 'lumberjack', :type => :class do
  let (:facts) { debian_facts }
  let(:pre_condition) { '$concat_basedir = "/tmp"' }
  let (:params) {
    {
      :config_dir => '/etc/lumberjack',
      :config_file => '/etc/default/lumberjack'
    }
  }

  describe 'without parameters' do
    it { should create_class('lumberjack') }
    it { should include_class('lumberjack::install') }
    it { should include_class('lumberjack::config') }
    it { should include_class('lumberjack::service') }

    it { should contain_package('lumberjack').with_ensure('present') }
    it { should contain_file('/etc/lumberjack').with_ensure('directory') }
    it { should contain_file('/var/log/lumberjack').with_ensure('directory') }
    it { should contain_file('/etc/default/lumberjack').with_ensure('present') }

    it { should contain_service('lumberjack').with(
        'ensure'     => 'running',
        'enable'     => 'true',
        'hasrestart' => 'true'
      )
    }
  end

  describe 'with parameter: config_dir' do
    let (:params) { { :config_dir => '_VALUE_' } }

    it { should contain_file('_VALUE_').with(
        'ensure'  => 'directory'
      )
    }
  end

  describe 'with parameter: config_dir_mode' do
    let (:params) { { :config_dir_mode => '_VALUE_' } }

    it {
      should contain_file('/etc/lumberjack').with(
        'mode' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: config_dir_recurse' do
    let (:params) { { :config_dir_recurse => true } }

    it {
      should contain_file('/etc/lumberjack').with(
        'recurse' => 'true'
      )
    }
  end

  describe 'with parameter: config_file' do
    let (:params) { { :config_file => '_VALUE_' } }

    it { should contain_file('_VALUE_').with(
        'ensure'  => 'present',
        'content' => /^LUMBERJACK_HOST/
      )
    }
  end

  describe 'with parameter: config_file_mode' do
    let (:params) { { :config_file_mode => '_VALUE_' } }

    it {
      should contain_file('/etc/default/lumberjack').with(
        'mode' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: config_group' do
    let (:params) { { :config_group => '_VALUE_' } }

    it {
      should contain_file('/etc/default/lumberjack').with(
        'group' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: config_user' do
    let (:params) { { :config_user => '_VALUE_' } }

    it {
      should contain_file('/etc/default/lumberjack').with(
        'owner' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: host' do
    let (:params) {
      {
        :host => '_VALUE_',
        :config_file => '_CONFIG_'
      }
    }

    it { should contain_file('_CONFIG_').with(
        'ensure'  => 'present',
        'content' => /^LUMBERJACK_HOST="_VALUE_"/
      )
    }
  end

  describe 'with parameter: init_script' do
    let (:params) { { :init_script => '_VALUE_' } }

    it { should contain_file('_VALUE_').with(
        'ensure'  => 'present'
      )
    }
  end

  describe 'with parameter: init_script_template' do
    let (:params) {
      {
        :init_script => '_SCRIPT_',
        :init_script_template => '_VALUE_'
      }
    }

    it { should contain_file('_SCRIPT_').with(
        'ensure'  => 'present',
        'content' => /_VALUE_/
      )
    }
  end

  describe 'with parameter: log_dir' do
    let (:params) { { :log_dir => '_VALUE_' } }

    it { should contain_file('_VALUE_').with(
        'ensure'  => 'directory'
      )
    }
  end

  describe 'with parameter: logs' do
    let (:params) {
      {
        :logs => [ '_VALUE_' ],
        :config_file => '_CONFIG_'
      }
    }

    it { should contain_file('_CONFIG_').with(
        'ensure'  => 'present',
        'content' => /^LUMBERJACK_LOGS.*_VALUE_/
      )
    }
  end

  describe 'with parameter: pkg_deps' do
    let (:params) { { :pkg_deps => '_VALUE_' } }

    it {
      should contain_package('_VALUE_')
    }
  end

  describe 'with parameter: pkg_ensure' do
    let (:params) { { :pkg_ensure => '_VALUE_' } }

    it {
      should contain_package('lumberjack').with(
        'ensure' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: pkg_list' do
    let (:params) { { :pkg_list => '_VALUE_' } }

    it {
      should contain_package('_VALUE_')
    }
  end

  describe 'with parameter: port' do
    let (:params) {
      {
        :port => '_VALUE_',
        :config_file => '_CONFIG_'
      }
    }

    it { should contain_file('_CONFIG_').with(
        'ensure'  => 'present',
        'content' => /^LUMBERJACK_PORT="_VALUE_"/
      )
    }
  end

  describe 'with parameter: service_enable' do
    let (:params) { { :service_enable => '_VALUE_' } }

    it {
      should contain_service('lumberjack').with(
        'enable' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: service_ensure' do
    let (:params) { { :service_ensure => '_VALUE_' } }

    it {
      should contain_service('lumberjack').with(
        'ensure' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: service_hasrestart' do
    let (:params) { { :service_hasrestart => '_VALUE_' } }

    it {
      should contain_service('lumberjack').with(
        'hasrestart' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: service_hasstatus' do
    let (:params) { { :service_hasstatus => '_VALUE_' } }

    it {
      should contain_service('lumberjack').with(
        'hasstatus' => '_VALUE_'
      )
    }
  end

  describe 'with parameter: service_name' do
    let (:params) { { :service_name => '_VALUE_' } }

    it {
      should contain_service('_VALUE_')
    }
  end

  describe 'with parameter: ssl_ca_path' do
    let (:params) {
      {
        :ssl_ca_path => '_VALUE_',
        :config_file => '_CONFIG_'
      }
    }

    it { should contain_file('_CONFIG_').with(
        'ensure'  => 'present',
        'content' => /^LUMBERJACK_SSL_CA_PATH="_VALUE_"/
      )
    }
  end

  describe 'with parameter: window_size' do
    let (:params) {
      {
        :window_size => '_VALUE_',
        :config_file => '_CONFIG_'
      }
    }

    it { should contain_file('_CONFIG_').with(
        'ensure'  => 'present',
        'content' => /^LUMBERJACK_WINDOW_SIZE="_VALUE_"/
      )
    }
  end
end

