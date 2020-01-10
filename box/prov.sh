sudo apt-get update
sudo apt-get install git curl unzip zip -y

if [ ! -d "/home/vagrant/bin" ]; then
  rm -rf temp
  rm -rf bin
  mkdir bin
  mkdir temp
  mv jdk-8-linux-x64.tar.gz temp
  cd temp
  tar -xvzf jdk-8-linux-x64.tar.gz
  mv jdk1.8.0 /home/vagrant/bin
  # chown -R vagrant:vagrant /home/vagrant/bin/jdk1.8.0
  echo "export JAVA_HOME='/home/vagrant/bin/jdk1.8.0'" >> /home/vagrant/.bashrc
  echo "export PATH='/home/vagrant/bin/jdk1.8.0/bin:$PATH'" >> /home/vagrant/.bashrc
else
  echo "java already configured"
fi

export JAVA_HOME="/home/vagrant/bin/jdk1.8.0"
export PATH="/home/vagrant/bin/jdk1.8.0/bin:$PATH"
rm -rf /home/vagrant/lib
mkdir /home/vagrant/lib
cd /home/vagrant/lib
git clone https://github.com/kongeor/jacksploit
cd jacksploit
./gradlew clean shadowJar
# cd /home/vagrant/lib/jacksploit
java -jar build/libs/jacksploit-all.jar &

