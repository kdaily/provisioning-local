# from https://github.com/JBKahn/provisioning-local/

sudo dnf install python2-setuptools git python2-devel libxml2-devel libxslt-devel ansible python2-dnf

sudo easy_install pip

cd ~
mkdir -p setup
cd setup
git clone https://github.com/kdaily/provisioning-local.git
cd provisioning-local

echo -e "please make sure to edit the config.json file followed by [ENTER]" && read USELESS_VAR

if [ ! -f /home/kdaily/.ssh/id_rsa.pub ]
then
  echo "No public SSH key found - be sure it is added to Github as well."
  exit 1
else
  ansible-playbook setup.yml -i HOSTS --ask-sudo-pass --module-path ./ansible_modules --extra-vars "@config.json"
fi
