# Movie managment project
### Create database, Flask application and server: 

__1.__  Created database as [here](https://github.com/cloudreach/talent-academy/blob/main/07_database.md)

 __2.__ Populated database and run different queries

 __3.__ Iterate over the database and show quries' results in a web page using Flask. Template files stored in [template directory](https://github.com/KlToti/movie_managment_project/tree/main/templates)
 
 __4.__ Creation of ec2 instance and other terraform resources/ data sources is shown as in [ec2-instance directory](https://github.com/KlToti/movie_managment_project/tree/main/ec2-instance).
 
 **Note** : As from previous examples and mistakes, make sure that the public subnet you are connecting to ec2 instance is declared public when creating 
 ```resource "aws_subnet"``` by adding ```map_public_ip_on_launch = true ```
 
 __5.__ After this step, update everything in the repository by running the following commands:
 
 ```
git init
git status
git add .
git commit -m "-insert message here-"
git push
```
### Deploy the movie managment application on server (*manually*):

__6.__ In terminal run the commands:
```
export AWS_DEFAULT_REGION="eu-central-1"
export AWS_PROFILE="talent-academy" 
```
Note: insert the right region and profile depending on the project.

__7.__ Initialize the terraform, plan and apply what was created in ec2-instance directory](https://github.com/KlToti/movie_managment_project/tree/main/ec2-instance):
```
terraform init
terraform plan
terraform apply
```
__8.__ Connect to server via ssh:
```
ssh -i ~/.ssh/<path to private key> ubuntu@<public IP address of EC2 instance>
```

**Note** : If you can not see the public IP address of EC2 instance in the AWS console, the reason is in **Note section in step 4**

__9.__ Once we are inside the server, run the commands as [here](https://github.com/KlToti/movie_managment_project/blob/main/ec2-instance/user-data.sh) 


### Deploy the movie managment application on server (*automatically*):
Because we added the user-data.sh shell script and incorporated into our code, we can deply our application automatically.

__6.__ Initialize the terraform, plan and apply what was created in ec2-instance directory](https://github.com/KlToti/movie_managment_project/tree/main/ec2-instance):
```
terraform init
terraform plan
terraform apply
```
__7.__ After the terraform code is applied, copy the public IP address of the EC2 instance and run it in the browser. If everything is correct, the application will be available.
