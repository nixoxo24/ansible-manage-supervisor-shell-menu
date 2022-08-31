#!/bin/bash

##########ANSIBLE MENU CREATED FOR ON PREMISE SUPERVISOR MANAGE
#By: Nixon Coronado


TODAY=`date +%Y%m%d`
TIME=`date +%H%M%S`

#Exporting the current script directory and the ansible logs directory
export SCRIPT_DIR=$(dirname $0)
export SCRIPT_LOG_DIR=/home/centos/ansible-menu-script/logs/ansible_menu_logs

#Creating the log file for the current execution
export SCRIPT_LOG_FILE=$SCRIPT_LOG_DIR/$TODAY-$TIME-ansible-menu.log

#Folder for the logs will be automatically created if currently not existing
if [[ ! -d $SCRIPT_LOG_DIR ]]; then
  mkdir -p $SCRIPT_LOG_DIR;
fi

#Captures the date and time of menu execution
echo "Date/Time of Execution:" $TODAY $TIME > $SCRIPT_LOG_FILE

#Function created to get details of the user (User Name, Action)
function ask_username_action() {
  echo "Enter Username:" | tee -a $SCRIPT_LOG_FILE
  read USERNAME
  echo $USERNAME >> $SCRIPT_LOG_FILE
  echo "What action do you want? (RESTART, STATUS, START OR STOP) " | tee -a $SCRIPT_LOG_FILE
  read ACTION
  case $ACTION in
    RESTART|restart)
        export ACTION_DIR="RESTART"
        echo $ACTION >> $SCRIPT_LOG_FILE
    ;;

    STATUS|status)
        export ACTION_DIR="STATUS"
        echo $TEAM >> $SCRIPT_LOG_FILE
    ;;

    START|start)
        export ACTION_DIR="START"
        echo $TEAM >> $SCRIPT_LOG_FILE
    ;;

    STOP|stop)
        export ACTION_DIR="STOP"
        echo $ACTION >> $SCRIPT_LOG_FILE
    ;;

    *)
      echo "Invalid input for action. Try again" | tee -a $SCRIPT_LOG_FILE
      launch_main_menu
    ;;
  esac

  export USERNAME
  export ACTION
}

TEXT_CLARK_SITE='CLARK site'
TEXT_PQ_SITE='PQ site'
TEXT_STAGING_SITE='Staging'

#Function created for restart site menu
function launch_ansible_restart_site_menu() {
  echo "1  - ${TEXT_CLARK_SITE}"  | tee -a $SCRIPT_LOG_FILE
  echo "2  - ${TEXT_PQ_SITE}"  | tee -a $SCRIPT_LOG_FILE
  echo "3  - ${TEXT_STAGING_SITE}"  | tee -a $SCRIPT_LOG_FILE
  echo "Q  - Quit"  | tee -a $SCRIPT_LOG_FILE

  echo "Please choose an action: "  | tee -a $SCRIPT_LOG_FILE
  read OPTION

  case $OPTION in
    1)
      echo "CLARK site" | tee -a $SCRIPT_LOG_FILE
      export SITE_DIR="restart_clark_site"
      bash  restart_clark_site.sh
    ;;

    2)
      echo "PQ site" | tee -a $SCRIPT_LOG_FILE
      export SITE_DIR="restart_pq_site"
      bash  restart_pq_site.sh
    ;;

    3)
      echo "Staging" | tee -a $SCRIPT_LOG_FILE
      export SITE_DIR="restart_staging"
      bash  restart_staging_site.sh
    ;;


    Q|q)
      exit
    ;;

    *)
      echo "Input out of option. Try again" | tee -a $SCRIPT_LOG_FILE

    ;;
  esac


}


#Function created for status site menu
function launch_ansible_status_site_menu() {
  echo "1  - ${TEXT_CLARK_SITE}"  | tee -a $SCRIPT_LOG_FILE
  echo "2  - ${TEXT_PQ_SITE}"  | tee -a $SCRIPT_LOG_FILE
  echo "3  - ${TEXT_STAGING_SITE}"  | tee -a $SCRIPT_LOG_FILE
  echo "Q  - Quit"  | tee -a $SCRIPT_LOG_FILE

  echo "Please choose an action: "  | tee -a $SCRIPT_LOG_FILE
  read OPTION

  case $OPTION in
    1)
      echo "CLARK site" | tee -a $SCRIPT_LOG_FILE
      export SITE_DIR="status_clark_site"
      bash  status_clark_site.sh
    ;;

    2)
      echo "PQ site" | tee -a $SCRIPT_LOG_FILE
      export SITE_DIR="status_pq_site"
      bash  status_pq_site.sh
    ;;

    3)
      echo "Staging" | tee -a $SCRIPT_LOG_FILE
      export SITE_DIR="status_staging"
      bash  status_staging_site.sh
    ;;

    Q|q)
      exit
    ;;

    *)
      echo "Input out of option. Try again" | tee -a $SCRIPT_LOG_FILE
      
    ;;
  esac


}


#Function created for start site menu
function launch_ansible_start_site_menu() {
  echo "1  - ${TEXT_CLARK_SITE}"  | tee -a $SCRIPT_LOG_FILE
  echo "2  - ${TEXT_PQ_SITE}"  | tee -a $SCRIPT_LOG_FILE
  echo "3  - ${TEXT_STAGING_SITE}"  | tee -a $SCRIPT_LOG_FILE
  echo "Q  - Quit"  | tee -a $SCRIPT_LOG_FILE

  echo "Please choose an action: "  | tee -a $SCRIPT_LOG_FILE
  read OPTION

  case $OPTION in
    1)
      echo "CLARK site" | tee -a $SCRIPT_LOG_FILE
      export SITE_DIR="start_clark_site"
      bash  start_clark_site.sh
    ;;

    2)
      echo "PQ site" | tee -a $SCRIPT_LOG_FILE
      export SITE_DIR="start_pq_site"
      bash  start_pq_site.sh
    ;;
    3)
      echo "Staging" | tee -a $SCRIPT_LOG_FILE
      export SITE_DIR="start_staging"
      bash  start_staging_site.sh
    ;;

    Q|q)
      exit
    ;;

    *)
      echo "Input out of option. Try again" | tee -a $SCRIPT_LOG_FILE
    ;;
  esac


}

#Function created for stop site menu
function launch_ansible_stop_site_menu() {
  echo "1  - ${TEXT_CLARK_SITE}"  | tee -a $SCRIPT_LOG_FILE
  echo "2  - ${TEXT_PQ_SITE}"  | tee -a $SCRIPT_LOG_FILE
  echo "3  - ${TEXT_STAGING_SITE}"  | tee -a $SCRIPT_LOG_FILE
  echo "Q  - Quit"  | tee -a $SCRIPT_LOG_FILE

  echo "Please choose an action: "  | tee -a $SCRIPT_LOG_FILE
  read OPTION

  case $OPTION in
    1)
      echo "CLARK site" | tee -a $SCRIPT_LOG_FILE
      export SITE_DIR="stop_clark_site"
      bash  stop_clark_site.sh
      
    ;;

    2)
      echo "PQ site" | tee -a $SCRIPT_LOG_FILE
      export SITE_DIR="stop_pq_site"
      bash  stop_pq_site.sh
    ;;
    
    3)
      echo "Staging" | tee -a $SCRIPT_LOG_FILE
      export SITE_DIR="stop_staging"
      bash  stop_staging_site.sh
    ;;


    Q|q)
      exit
    ;;

    *)
      echo "Input out of option. Try again" | tee -a $SCRIPT_LOG_FILE
    ;;
  esac


}

#Function created to call all the related functions that would display the whole menu
function launch_main_menu() {
  ask_username_action

  if [[ "${ACTION}" == "RESTART" || "${ACTION}" == "restart" ]]; then
        echo "This is restart"  | tee -a $SCRIPT_LOG_FILE
        launch_ansible_restart_site_menu
  elif [[ "${ACTION}" == "STATUS" || "${ACTION}" == "status" ]]; then
        echo "This is status"  | tee -a $SCRIPT_LOG_FILE
        launch_ansible_status_site_menu
  elif [[ "${ACTION}" == "START" || "${ACTION}" == "start" ]]; then
        echo "This is start"  | tee -a $SCRIPT_LOG_FILE
        launch_ansible_start_site_menu
  elif [[ "${ACTION}" == "STOP" || "${ACTION}" == "stop" ]]; then
        echo "This is stop"  | tee -a $SCRIPT_LOG_FILE
        launch_ansible_stop_site_menu
  fi

  echo "Would you like to do another transaction? (y/n): "  | tee -a $SCRIPT_LOG_FILE
  read LOOP

  if [[ "${LOOP}" == "y" || "${LOOP}" == "Y" ]]; then
    launch_main_menu
  fi
}

launch_main_menu