---
# Welcome to Project BJC
![Magic!](http://i.imgur.com/hknf3Wx.jpg)

Here you will find instructions on how to spin up a standard Chef Demo environment in AWS, as well as instructions on how you can contribute to demo development.  This document assumes you have basic familiarity with AWS, Cloudformation, and SSH keys.  This project is maintained by the Solutions Architects team at Chef.  Issues, pull requests and general feedback are all welcome.  You may email us at saleseng [at] chef.io if you want to get in touch.

The talk track script for the standard demo is [located here](https://github.com/chef-cft/bjc/blob/master/SSL_Demo_Script.md)

---
## What is BJC?
---
BJC stands for Blue Jean Committee. It's also the code name for the Chef Demo project.

---
## How do I spin up a demo?
---
#### First, setup your environment:
1. Clone this repository: `git clone https://github.com/chef-cft/bjc`
2. Change into the bjc directory: `cd bjc`
3. Set environment variables for your AWS SSH key name and path, like so.  This must match one of the authorized ec2 ssh keys in your AWS account.
    * Put these lines into your ~/.bashrc or ~/.zshrc if you want to make them permanent.

   ```bash
   export EC2_SSH_KEY_NAME=binamov-sa
   export EC2_SSH_KEY_PATH=~/.ssh/binamov-sa.pem
   ```

#### Next, follow these steps to spin up your own dev/test environment:
The demo environment will provision in AWS fairly quickly, usually within a few minutes.  Once the environment is up there is a startup script you must run to prep the demo.  This script can take 10 minutes or more to complete.  Be sure to give yourself plenty of time prior to the start of your demo for the environment to spin up and for the startup script to run to completion.  We generally recommend setting up at least 30 minutes before your demo to ensure you have enough time.

1.  `git pull` to fetch the latest changes.
2.  Use the `build_demo.sh` script in the ./bin directory to stand up the latest stable stack in us-west-2.
    * Your command will look something like the command below.

    ```bash
    ./bin/build_demo.sh <cloud>-<version> <customer_name> <EC2 key pair name> <TTL> <your_name> <team_name>
    ```
  For example:

  ```bash
  ./bin/build_demo.sh aws-0.2.1 'RobCo' scarolan_sa 4 'Sean Carolan' 'Solutions Architects'
  ```

3.  Log onto your stack's workstation
    * The IP is listed under your stack's outputs in the AWS CloudFormation Management Console.
    * Workstation credentials are pinned in #chef-demo-project slack channel.  
    * If you are not a Chef employee please contact saleseng@chef.io to get the username and password.

4.  Optional:  If you want to use Test Kitchen inside your demo environment, you'll need to go into the AWS control panel, select EC2, and then go into 'Key Pairs'.  Choose "Import New Key Pair" and import the chef_demo.pub file stored in this repo into the us-west-2 region of your account.  Alternatively you can simply edit the existing .kitchen.yml file inside the cookbook with any valid SSH key name in us-west-2 in your account.

5.  Run the "start me up" script on the desktop and get your demo on!
    * This is the script that can take 10+ minutes to complete.
    * Report any issues you find here:  [https://waffle.io/chef-cft/bjc](https://waffle.io/chef-cft/bjc)
---
