require 'spec_helper'

describe 'jenkins_test_utils::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html

  # Server is runnign #
  describe port(8080) do
    it { should be_listening }
  end

  describe command('wget http://localhost:8080/job/test_job_1') do
    its(:exit_status) { should eq 0 }
  end

  describe command('wget http://localhost:8080/job/test_job_2') do
    its(:exit_status) { should eq 0 }
  end
end
