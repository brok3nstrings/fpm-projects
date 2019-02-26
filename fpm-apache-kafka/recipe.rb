class ApacheKafka < FPM::Cookery::Recipe
  name 'apache-kafka'
  version '2.12-2.0.0'
  revision '7'
  description 'This package installs apache-kafka.'
  source "http://mirror.cogentco.com/pub/apache/kafka/2.0.0/kafka_#{version}.tgz"
  homepage 'https://kafka.apache.org/quickstart'
  directories '/opt/kafka','/etc/kafka'

  def build
  end

  def install
	  opt('kafka').install Dir['*']
	  etc('kafka').install workdir('cfg/server.properties')
	  etc('kafka').install workdir('cfg/zookeeper.properties')
          etc('systemd/system').install workdir('cfg/kafka.service')
	  etc('systemd/system').install workdir('cfg/zookeeper.service')
	  etc('sysconfig').install workdir('cfg/kafka')
  end

  post_install 'post_install.sh'
  
  def uninstall
  end

  post_uninstall 'post_uninstall.sh'

end        
