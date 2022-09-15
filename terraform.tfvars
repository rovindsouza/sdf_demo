
autoscale_nodepool_min_node_count=5
cluster_name= "cluster"
autoscale_nodepool_max_node_count=20
cluster_autoscale_cpu_max=80
cluster_autoscale_cpu_min=20
cluster_autoscale_mem_max=4096
cluster_autoscale_mem_min=2048
cluster_description= "GKE multi region cluster"
clusters=[{"cluster_location":"us-central1","subnetwork":"un-central1","secondary_range_pods":"pods","secondary_range_services":"services","master_ipv4_cidr_block":"192.168.2.1/24"}]
network= "test"
sync_branch= "main"
project_id= "sapient-helix-352609"