# from https://github.com/JBKahn/provisioning-local/

sudo dnf install -y python2-setuptools git python2-devel libxml2-devel libxslt-devel ansible python2-dnf

sudo easy_install pip

cd ~
mkdir -p setup
cd setup
git clone https://github.com/kdaily/provisioning-local.git
cd provisioning-local

echo -e "please make sure to edit the config.json file followed by [ENTER]" && read USELESS_VAR

if [ ! -f ~/.ssh/id_rsa.pub ]
then
  curl https://raw.githubusercontent.com/kdaily/provisioning-local/master/id_rsa.pub > ~/.ssh/id_rsa.pub
else
  ansible-playbook setup.yml -i HOSTS --become --module-path ./ansible_modules --extra-vars "@config.json"
fi
