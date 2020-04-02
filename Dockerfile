FROM registry.access.redhat.com/ubi8/ubi:latest

# Install rpms and golang
RUN dnf install -y vim git curl tar sudo gcc && \
    dnf update --disableplugin=subscription-manager -y && rm -rf /var/cache/yum && \
    dnf clean all && \
    curl -L https://dl.google.com/go/go1.14.1.linux-amd64.tar.gz -o go.tar.gz && \
    tar -C /usr/local -xzf go.tar.gz && \
    rm go.tar.gz && \
    mkdir /go

# Set env
ENV PATH="${PATH}:/usr/local/go/bin"
ENV GOPATH "/go"

# Install go tools
RUN go get golang.org/x/tools/cmd/godoc                                 && \
    go get github.com/nsf/gocode                                        && \
    go get golang.org/x/tools/cmd/goimports                             && \
    go get github.com/rogpeppe/godef                                    && \
    go get golang.org/x/tools/cmd/gorename                              && \
    go get golang.org/x/lint/golint                                     && \
    go get github.com/kisielk/errcheck                                  && \
    go get github.com/jstemmer/gotags                                   && \
    go get github.com/tools/godep                                       && \
    go get github.com/zmb3/gogetdoc					&& \
    go get golang.org/x/tools/cmd/guru					&& \
    go get golang.org/x/tools/gopls 					&& \
    go get github.com/go-delve/delve/cmd/dlv				&& \
    go get github.com/golangci/golangci-lint/cmd/golangci-lint		&& \
    mv /go/bin/* /usr/local/go/bin                                      && \
# Cleanup
    rm -rf /go/*

# COPY vimrc
COPY vimrc /root/.vimrc

# Install vim-go
RUN curl -fLo /root/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    git clone https://github.com/fatih/vim-go.git ~/.vim/plugged/vim-go && \
    vim +PlugInstall +qall && \
# Update vimrc to use molakai (required to enable after plugin install)
    sed -i "s/\"let g:molokai_original = 1/let g:molokai_original = 1/" /root/.vimrc && \
    sed -i "s/\"colorscheme molokai/colorscheme molokai/" /root/.vimrc 

# COPY startup script to run as current user
COPY startup.sh /startup.sh
CMD ["/startup.sh"]
