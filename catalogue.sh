
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd roboshop
cp catalogue.service  /etc/systemd/system/catalogue.service
rm -rf /app
mkdir /app 
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip 
cd /app 
unzip /tmp/catalogue.zip
npm install 
systemctl daemon-reload
systemctl enable catalogue 
systemctl restart catalogue
yum install mongodb-org-shell -y

mongo --host 172.31.83.27 </app/schema/catalogue.js


