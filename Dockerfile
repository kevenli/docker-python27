FROM gatsbylee/centos6-python27:6.9.1

# install required packages
USER root
RUN yum -y install gcc mysql mysql-devel libaio.x86_64 glibc.x86_64

# install oracle client
RUN yum -y localinstall http://oss.kffund.cn/rpm/oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm  --nogpgcheck
RUN yum -y localinstall http://oss.kffund.cn/rpm/oracle-instantclient11.2-devel-11.2.0.4.0-1.x86_64.rpm   --nogpgcheck
ENV ORACLE_HOME=/usr/lib/oracle/11.2/client64
ENV PATH=$PATH:$ORACLE_HOME/bin
ENV LD_LIBRARY_PATH=$ORACLE_HOME/lib

# install pip
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python2.7 get-pip.py
ENV PATH=$PATH:/usr/lib/python27/bin
RUN ln -s /usr/bin/pip2.7 /usr/bin/pip

