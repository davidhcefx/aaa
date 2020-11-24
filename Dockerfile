from ubuntu:18.04
#run apt-get update
#run apt-get -y upgrade
#run apt-get -y install xinetd

#run useradd -m constr
#add src/constr /home/constr/
#add src/flag   /home/constr/
#add xinetd /etc/xinetd.d/

#user constr
#cmd ["/usr/sbin/xinetd", "-dontfork"]
cmd "echo $PORT"
