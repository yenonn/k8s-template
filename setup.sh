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
## k8s-template starts here
:autocmd BufNewFile [P|p]od*.yaml 0r ~/.vim/templates/pod-definition.yaml
:autocmd BufNewFile [R|r]c.yaml 0r ~/.vim/templates/rc-definition.yaml
## k8s-template endd here
EOF

fi
