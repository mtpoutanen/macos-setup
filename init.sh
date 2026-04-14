cd ~
mkdir .ssh
touch ~/.ssh/config
ssh-keygen -t rsa -b 4096 -C "mtpoutanen@gmail.com"
eval "$(ssh-agent -s)"

echo "now add something like this to ~/.ssh/config"
echo "Host github.com"
echo "  AddKeysToAgent yes"
echo "  UseKeychain yes"
echo "  IdentityFile ~/.ssh/id_ed25519"
