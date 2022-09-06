
secondary_range_services= "services"
cluster_location= "us-central1"
project_id= "sapient-helix-352609"
cluster_description= " This is a simple single tenant cluster"
secondary_range_pods= "pods"
network= "test"
subnetwork= "un-central1"
vertical_pod_autoscaling=true
cluster_autoscaling=[{"enabled":"true","cpu_min":"10","cpu_max":"80","memory_min":"1024","memory_max":"4096"}]