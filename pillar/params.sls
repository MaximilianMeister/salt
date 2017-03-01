# the CIDR for cluster IPs (internal IPs for Pods)
cluster_cidr:     '172.20.0.0/16'

# the CIDR for services (virtual IPs for services)
services_cidr:    '172.21.0.0/16'

# the API service IP (must be inside the 'services_cidr')
api_cluster_ip:   '172.21.0.1'

# port for listening for SSL connections
api_ssl_port:     '6443'

# DNS service IP and some other stuff (must be inside the 'services_cidr')
dns:
  cluster_ip:     '172.21.0.2'
  domain:         'cluster.local'
  replicas:       '1'

# user and group for running services and some other stuff...
kube_user:        'kube'
kube_group:       'kube'

# use a docker registry mirror (it must be a http service)
# docker_registry_mirror: 'mymirror.com:5000'

# install the addons (ie, DNS)
addons:           'false'

paths:
  ca_dir:         '/etc/pki/trust/anchors'
  ca_filename:    'SUSE_CaaSP_CA.crt'
  var_kubelet:    '/var/lib/kubelet'

# etcd details
# notes:
# - the token must be shared between all the machines in the cluster
# - the discovery id is also unique for all the machines in the
#   cluster (in fact, it can be the same as the token)
etcd:
  masters:        '1'
  token:          'k8s'
  disco:
    port:         '2379'
    id:           'k8s'

# the flannel backend ('udp', 'vxlan', 'host-gw', etc)
flannel:
  backend:        'host-gw'
  etcd_key:       '/flannel/network'
  iface:          'eth0'
