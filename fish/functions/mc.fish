function mc -d "ssh into MC server" 
    set file (find ~/.config/fish/ -name AWSt2large.pem 2> /dev/null)
    if [ -f "$file" ]
	echo "Trying to establish connection to minecraft server";
	ssh -i "$file" ec2-user@ec2-18-216-9-45.us-east-2.compute.amazonaws.com;
    else
	echo "File doesn't exist. Unable to establish connection";
    end
end
