#cb_cluster = Couchbase::Cluster.new({ username: Yetting.couchbase_admin, password: Yetting.couchbase_admin_password})
#pp cb_cluster.inspect
$cb = Connections.new
CB = $cb.connections.default
