#!/bin/bash

CWD=`pwd`
TEMPLATES_DIR=$CWD/templates

### setting up the templates directory
mkdir -p ~/.vim
ln -snf $TEMPLATES_DIR ~/.vim/templates 

### injecting the template to .vimrc
if [ -f ~/.vimrc ]
then
  cat <<-EOF >> ~/.vimrc
"" k8s-template starts here
:autocmd BufNewFile [P|p]od*.yaml 0r ~/.vim/templates/pod-definition.yaml
:autocmd BufNewFile [R|r]c*.yaml 0r ~/.vim/templates/rc-definition.yaml
:autocmd BufNewFile [R|r]s*.yaml 0r ~/.vim/templates/rs-definition.yaml
:autocmd BufNewFile [D|d]eploy*.yaml 0r ~/.vim/templates/deployment-definition.yaml
:autocmd BufNewFile [N|n]amespace*.yaml 0r ~/.vim/templates/namespace-definition.yaml
:autocmd BufNewFile [S|s]ervice*.yaml 0r ~/.vim/templates/service-definition.yaml
"" k8s-template ends here
EOF
fi

### doing cleanup
if [ "$1" == "--clean" ]
then
  sed -i '/k8s-template starts/,/k8s-template ends/d' ~/.vimrc
  unlink ~/.vim/templates
  rm -fr ~/.vim
fi
