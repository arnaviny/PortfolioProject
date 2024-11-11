#!/bin/bash
# עדכון החבילות במערכת
sudo yum update -y

# התקנת Apache
sudo yum install httpd -y

# התקנת Git
sudo yum install git -y

# הפעלת Apache ושמירה על הפעלתו באתחול
sudo systemctl start httpd
sudo systemctl enable httpd

# מחיקת קבצים קיימים בתיקיית /var/www/html
sudo rm -rf /var/www/html/*

# הורדת הפרויקט מ-GitHub לתיקיית /var/www/html
sudo git clone https://github.com/arnaviny/PortfolioProject.git /var/www/html/

# שינוי הרשאות לתיקייה
sudo chown -R apache:apache /var/www/html

# מתן הרשאות גישה ל-Apache
sudo chmod -R 755 /var/www/html

# הפעלת Apache מחדש כדי לוודא שהשינויים נכנסו לתוקף
sudo systemctl restart httpd
