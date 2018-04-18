#spec/jenkins.rb
require 'dockerspec/serverspec'

describe 'My Dockerfile' do
  describe docker_build('.') do

    it { should have_cmd ['/bootstrap.sh'] }
    describe docker_run(described_image) do
      describe file('/bootstrap.sh') do
        it { should be_file }
        it { should contain 'systemctl start jenkins.service' }
      end

      describe service('httpd') do
        it { should be_enabled }
      end
    end

  end
end

