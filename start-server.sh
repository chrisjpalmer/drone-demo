source .env

docker run \
  --volume=/var/lib/drone:/data \
  --env=DRONE_GITHUB_CLIENT_ID=$gh_client_id \
  --env=DRONE_GITHUB_CLIENT_SECRET=$gh_secret_id \
  --env=DRONE_RPC_SECRET=$shared_secret \
  --env=DRONE_SERVER_HOST=$url \
  --env=DRONE_SERVER_PROTO=https \
  --publish=80:80 \
  --publish=443:443 \
  --restart=always \
  --detach=true \
  --name=drone \
  drone/drone:2

ngrok http --domain=$url 80