FROM centos:latest
RUN yum update ansible && yum install -y python-devel libxslt-devel libxml2-devel epel-release && yum install -y ansible && yum install -y openssh-clients
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python get-pip.py
RUN pip install lxml
ADD . /etc/ansible/
VOLUME ["/etc/ansible"]
RUN echo "host_key_checking = False" >> /etc/ansible/ansible.cfg
ENV ANSIBLE_HOST_KEY_CHECKING False
