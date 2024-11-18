- Instructions on how to install and use the server data collector
- What is "server data collector":
  - https://gitlab.com/gmastrokostas/server_data_collector/-/blob/main/README.md?ref_type=heads
  - git@gitlab.com:gmastrokostas/server_data_collector.git


# - INSTALLATION
----------------------------------------------------------------------------------------------------------
1- To install this software your node needs to have:
   - Redhat/Rocky 9
   - 1>GB of RAM

2- Packages installed (all default packages)
   - PostgreSQL 13.9
   - Ansible 2.14
   - ansible-runner
   - python3-psycopg2

2- Clone the installer
   git clone git@gitlab.com:gmastrokostas/install_server_data_collector.git

3- Insert the hostname in the inventory file of the server you want to install this solution

4- Execute
   ansible-playbook install_server_data_collector_role.yml -i inventory -k -K

5- Passwordless access to remote servers:
   - Your remote servers need to have a service account named "seeker"
   - You will need to setup ssh passwordless access between your node and all the remote servers with the "seeker" account.

