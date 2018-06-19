plan pdbtest {
  return(puppetdb_query("nodes[certname] {}"))
}
