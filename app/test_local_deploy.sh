#!/bin/bash

SERVER_IP="192.168.x.x" # adapte
SERVER_USER="deployuser"
SSH_KEY="$HOME/.ssh/id_rsa"

echo "Test de connexion SSH..."
ssh -i "$SSH_KEY" -o BatchMode=yes -o ConnectTimeout=5 $SERVER_USER@$SERVER_IP "echo 'Connexion SSH OK'" || exit 1

echo "Test exécution sudo sans mot de passe..."
ssh -i "$SSH_KEY" $SERVER_USER@$SERVER_IP "sudo -n true" || { echo "Erreur sudo sans mot de passe"; exit 1; }

echo "Test création de répertoire d'application..."
ssh -i "$SSH_KEY" $SERVER_USER@$SERVER_IP "mkdir -p ~/deploy_test && echo 'Répertoire créé'" || exit 1

echo "Vérification des services système disponibles..."
ssh -i "$SSH_KEY" $SERVER_USER@$SERVER_IP "systemctl is-active sshd" || { echo "Service sshd non actif"; exit 1; }

echo "Tous les tests sont passés avec succès."
