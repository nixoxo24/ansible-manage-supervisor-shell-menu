#!/bin/bash


#RESTART

export USER=$(logname)
export TS=$(date +%s)
export log_dir="/home/sepayvo/ansible_logs"


#Function for selecting site option if all servers or specific
function select_site_option_pq() {
  echo "Welcome to On premise PQ site"  | tee -a $SCRIPT_LOG_FILE
  echo "All servers or specific?:"  | tee -a $SCRIPT_LOG_FILE
  echo "1 - All servers"  | tee -a $SCRIPT_LOG_FILE
  echo "2 - Specific servers"  | tee -a $SCRIPT_LOG_FILE
  echo "Q - CANCEL"  | tee -a $SCRIPT_LOG_FILE
  read SITE_SELECT
   
    case $SITE_SELECT in
    1)
      echo "All servers" | tee -a $SCRIPT_LOG_FILE
      export SITE_SELECT="All servers"
      echo "This is clark site all servers" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit datacenter # ansible command to restart all servers
      
    ;;

    2)
      echo "Specific server" | tee -a $SCRIPT_LOG_FILE
      export SITE_SELECT="Specific servers"
      echo "This is pq site specific server" | tee -a $SCRIPT_LOG_FILE
      #ansible all -m ping -v # ping
      select_server_pq
      
      
    ;;

    Q|q)
      echo "Selection cancelled" | tee -a $SCRIPT_LOG_FILE
      exit
    ;;

    *)
      echo "Input out of option" | tee -a $SCRIPT_LOG_FILE
      select_site_option_pq
    ;;
  esac
}

  
  #Function for specific server selection
  function select_server_pq() {
  echo "Please select server:" | tee -a $SCRIPT_LOG_FILE
  echo "1.Bancnet-1" | tee -a $SCRIPT_LOG_FILE
  echo "2.Bancnet-2" | tee -a $SCRIPT_LOG_FILE
  echo "3.Visa-1" | tee -a $SCRIPT_LOG_FILE
  echo "4.Visa-2" | tee -a $SCRIPT_LOG_FILE
  echo "5.Smartpay-1" | tee -a $SCRIPT_LOG_FILE
  echo "6.Smartpay-2" | tee -a $SCRIPT_LOG_FILE
  echo "7.Card id-1" | tee -a $SCRIPT_LOG_FILE
  echo "8.Card id-2" | tee -a $SCRIPT_LOG_FILE
  echo "9.Key exchange-1" | tee -a $SCRIPT_LOG_FILE
  echo "10.Key exchange-2" | tee -a $
  echo "11.EFS Personalization-1" | tee -a $SCRIPT_LOG_FILE
  echo "12.EFS Personalization-2" | tee -a $SCRIPT_LOG_FILE
  echo "13.Pin verification-1" | tee -a $SCRIPT_LOG_FILE
  echo "14.Pin verification-2" | tee -a $SCRIPT_LOG_FILE
  echo "15.EFS Wrapper-1" | tee -a $SCRIPT_LOG_FILE
  echo "16.EFS Wrapper-2" | tee -a $SCRIPT_LOG_FILE
  echo "17.EFS Wrapper-3" | tee -a $SCRIPT_LOG_FILE
  echo "18.EFS Wrapper-4" | tee -a $SCRIPT_LOG_FILE
  echo "19.EFS Portal-1" | tee -a $SCRIPT_LOG_FILE
  echo "20.EFS Portal-2" | tee -a $SCRIPT_LOG_FILE
  echo "21.Bus Portal-1" | tee -a $SCRIPT_LOG_FILE
  echo "22.Bus Portal-2" | tee -a $SCRIPT_LOG_FILE
  echo "23.SFTP" | tee -a $SCRIPT_LOG_FILE
  echo "Q TO CANCEL"  | tee -a $SCRIPT_LOG_FILE

  read SPECIFIC_PQ

  case $SPECIFIC_PQ in
    1)
      echo "Bancnet-1" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit server1 #issuerse_bancnet1_pq
  
    ;;

    2)
      echo "Bancnet-2" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit issuerse_bancnet2_pq
      
    ;;

    3)
      echo "Visa-1" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit issuerse_visa1_pq

    ;;

    4)
      echo "Visa-2" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit issuerse_visa2_pq
    ;;

    5)
      echo "Smartpay-1" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit issuerse_smartpay1_pq
    ;;
    6)
      echo "Smartpay-2" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit issuerse_smartpay2_pq
    ;;
    7)
      echo "Card id-1" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit cardidse1_pq
    ;;
    8)
      echo "Card id-2" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit cardidse2_pq 

    ;;
    9)
      echo "Key exchange-1" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit key_exchange1_pq 
    ;;
    10)
      echo "Key exchange-2" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit  key_exchange2_pq 
    ;;
    11)
      echo "EFS Personalization-1" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit efs1_personalization_pq
    ;;
    12)
      echo "EFS Personalization-2" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit efs2_personalization_pq
    ;;
    13)
      echo "Pin verification-1" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit pin_verificationse1_pq
    ;;
    14)
      echo "Pin verification-2" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit pin_verificationse2_pq
    ;;
    15)
      echo "EFS Wrapper-1" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit efs_wrapper1_pq
    ;;
    16)
      echo "EFS Wrapper-2" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit efs_wrapper2_pq
    ;;
    17)
      echo "EFS Wrapper-3" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit efs_wrapper3_pq
    ;;
    18)
      echo "EFS Wrapper-4" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit efs_wrapper4_pq
    ;;
    19)
      echo "EFS Portal-1" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit efs_portal1_wrapper_pq
    ;;
    20)
      echo "EFS Portal-2" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit efs_portal2_wrapper_pq
    ;;
    21)
      echo "Bus Portal-1" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit busportalese1_pq
    ;;
    22)
      echo "Bus Portal-2" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit busportalese2_pq
    ;;
    23)
      echo "SFTP" | tee -a $SCRIPT_LOG_FILE
      ansible-playbook -i inventory supervisor_start.yaml --limit sftp_pq
    ;;

    Q|q)
      echo "Action cancelled" | tee -a $SCRIPT_LOG_FILE
      exit
    ;;

    *)
      echo "Input out of option" | tee -a $SCRIPT_LOG_FILE
      supervisor_manage_action
    ;;
  esac
}

select_site_option_pq