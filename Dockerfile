from ubuntu:18.04
run apt-get update
run apt-get -y upgrade
run apt-get -y install netcat
run useradd -m user

add src/constr /home/user/
add src/flag   /home/user/
add run.sh     /

user user
cmd ["/run.sh"]
