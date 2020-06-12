#!/bin/bash

echo "KUBELET_EXTRA_ARGS='--node-ip=172.27.11.$1'" > /etc/default/kubelet
$(ssh -o stricthostkeychecking=no 172.27.11.10 kubeadm token create --print-join-command)
