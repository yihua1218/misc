docker run --detach ^
    --hostname gitlab.hoebus.idv.tw ^
    --name gitlab ^
    --restart always ^
    -p 6080:80 ^
    -p 6443:443 ^
    -p 6022:22 ^
    -v gitlab_config:/etc/gitlab ^
    -v gitlab_logs:/var/log/gitlab ^
    -v gitlab_data:/var/opt/gitlab ^
    gitlab/gitlab-ce:latest