#!/usr/bin/env bash

function generatePassword() {
    openssl rand -hex 16
}

JICOFO_AUTH_PASSWORD=$(generatePassword)
JVB_AUTH_PASSWORD=$(generatePassword)
JIGASI_XMPP_PASSWORD=$(generatePassword)
JIBRI_RECORDER_PASSWORD=$(generatePassword)
JIBRI_XMPP_PASSWORD=$(generatePassword)
JIGASI_TRANSCRIBER_PASSWORD=$(generatePassword)

# ---- NUEVAS LÍNEAS PARA MOSTRAR LAS CONTRASEÑAS ----
echo "Por favor, copia estas contraseñas en tu archivo .env si no se actualizan automáticamente:"
echo "JICOFO_AUTH_PASSWORD=${JICOFO_AUTH_PASSWORD}"
echo "JVB_AUTH_PASSWORD=${JVB_AUTH_PASSWORD}"
echo "JIGASI_XMPP_PASSWORD=${JIGASI_XMPP_PASSWORD}"
echo "JIBRI_RECORDER_PASSWORD=${JIBRI_RECORDER_PASSWORD}"
echo "JIBRI_XMPP_PASSWORD=${JIBRI_XMPP_PASSWORD}"
echo "JIGASI_TRANSCRIBER_PASSWORD=${JIGASI_TRANSCRIBER_PASSWORD}"
echo "----------------------------------------------------"
# ----------------------------------------------------

sed -i.bak \
    -e "s#JICOFO_AUTH_PASSWORD=.*#JICOFO_AUTH_PASSWORD=${JICOFO_AUTH_PASSWORD}#g" \
    -e "s#JVB_AUTH_PASSWORD=.*#JVB_AUTH_PASSWORD=${JVB_AUTH_PASSWORD}#g" \
    -e "s#JIGASI_XMPP_PASSWORD=.*#JIGASI_XMPP_PASSWORD=${JIGASI_XMPP_PASSWORD}#g" \
    -e "s#JIBRI_RECORDER_PASSWORD=.*#JIBRI_RECORDER_PASSWORD=${JIBRI_RECORDER_PASSWORD}#g" \
    -e "s#JIBRI_XMPP_PASSWORD=.*#JIBRI_XMPP_PASSWORD=${JIBRI_XMPP_PASSWORD}#g" \
    -e "s#JIGASI_TRANSCRIBER_PASSWORD=.*#JIGASI_TRANSCRIBER_PASSWORD=${JIGASI_TRANSCRIBER_PASSWORD}#g" \
    "$(dirname "$0")/.env"