#!/bin/bash


#RESTART

export USER=$(logname)
export TS=$(date +%s)
export log_dir="/home/centos/ansible-menu-script/logs"


#Function for selecting site option if all servers or specific
function select_site_option_staging() {
  echo "Welcome to On premise staging site"  | tee -a $SCRIPT_LOG_FILE
  echo "All servers or specific?:"  | tee -a $SCRIPT_LOG_FILE
  echo "1 - All servers"  | tee -a $SCRIPT_LOG_FILE
  echo "2 - Specific servers"  | tee -a $SCRIPT_LOG_FILE
  echo "Q - CANCEL"  | tee -a $SCRIPT_LOG_FILE
  read SITE_SELECT
   
    case $SITE_SELECT in
    1)
      echo "All servers" | tee -a $SCRIPT_LOG_FILE
      export SITE_SELECT="All servers"
      echo "This is staging site all servers" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit datacenter | tee -a $SCRIPT_LOG_FILE #splunk-servers # ansible command to restart all servers
      
    ;;

    2)
      echo "Specific server" | tee -a $SCRIPT_LOG_FILE
      export SITE_SELECT="Specific servers"
      echo "This is staging site specific server" | tee -a $SCRIPT_LOG_FILE
      #ansible all -m ping -v # ping
      select_server_staging
      
      
    ;;

    Q|q)
      echo "Selection cancelled" | tee -a $SCRIPT_LOG_FILE
      exit
    ;;

    *)
      echo "Input out of option" | tee -a $SCRIPT_LOG_FILE
      select_site_option_staging
    ;;
  esac
}

  
  #Function for specific server selection
  function select_server_staging() {
  echo "Please select server:" | tee -a $SCRIPT_LOG_FILE
  echo "1.Splunk-1" | tee -a $SCRIPT_LOG_FILE
  echo "2.Splunk-2" | tee -a $SCRIPT_LOG_FILE
  echo "Q TO CANCEL"  | tee -a $SCRIPT_LOG_FILE

  read SPECIFIC_staging

  case $SPECIFIC_staging in
    1)
      echo "Splunk-1" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit server1 | tee -a $SCRIPT_LOG_FILE #splunk1
  
    ;;

    2)
      echo "Splunk-2" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit server2 | tee -a $SCRIPT_LOG_FILE #splunk2
      
    ;;

    Q|q)
      echo "Action cancelled" | tee -a $SCRIPT_LOG_FILE
      exit
    ;;

    *)
      echo "Input out of option" | tee -a $SCRIPT_LOG_FILE
      select_site_option_staging
    ;;
  esac
}
select_site_option_staging