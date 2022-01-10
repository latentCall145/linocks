HOST=$1
PASSWD=$2
PORT=$3

#sudo apt install sshpass

echo '***'
echo 'Note: If you already have an RSA key, do not overwrite your key.'
echo 'Host: '$HOST
echo 'Port: '$PORT
echo '***'

ssh-keygen -t rsa
ssh -p $PORT $HOST mkdir -p .ssh
cat ~/.ssh/id_rsa.pub | ssh -p $PORT $HOST 'cat >> .ssh/authorized_keys'
ssh -p $PORT $HOST "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"
