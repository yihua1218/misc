FROM yihua1218/ami-node:latest
COPY basnrc /root/.bashrc
RUN export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && npm install -g yarn
