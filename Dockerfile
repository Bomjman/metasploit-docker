FROM kalilinux/kali-rolling:latest

RUN apt update && apt install curl systemctl -y && \
    curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
    chmod 755 msfinstall && \
    ./msfinstall

RUN service postgresql start && systemctl enable postgresql

CMD [ "msfconsole" ]